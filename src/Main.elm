module Main exposing (Flags, main)

import Browser
import Browser.Dom
import Browser.Navigation
import CookieBanner exposing (saveConsent)
import GoogleAnalytics
import Html.Styled exposing (Html, toUnstyled)
import Http
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Json.Decode
import Message exposing (Msg(..))
import Metadata
import Page.Data
import Page.Guide.Data
import Page.Guide.View
import Page.Guides.Data
import Page.Guides.View
import Page.Index
import Page.NotFound exposing (resourceNotFound)
import Page.Shared.Data
import Page.Story.Data
import Page.Story.View
import Page.SubmitStory.View
import Page.View
import Random
import Route exposing (Route(..))
import Shared exposing (Content, CookieState, Model, Request(..))
import Task
import Theme.PageTemplate
import Url


type alias Flags =
    Json.Decode.Value


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = viewDocument
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }


init : Flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        maybeRoute : Maybe Route
        maybeRoute =
            Route.fromUrl url

        storedConsent : String
        storedConsent =
            consentDecoder flags

        hasConsented : Bool
        hasConsented =
            -- for null, false & undefined, we assume no consent
            storedConsent == "true"

        showCookieBanner : Bool
        showCookieBanner =
            -- user has previously stated a preference, info should be collapsed
            storedConsent == "null"

        page : Route
        page =
            Maybe.withDefault Index maybeRoute

        content : Content
        content =
            Shared.contentDictDecoder flags
    in
    ( { key = key
      , page = page
      , cookieState =
            { enableAnalytics = hasConsented
            , cookieBannerIsOpen = showCookieBanner
            }
      , content = content
      , language = English
      , search = []
      , query = ""
      , externalActions = Loading
      , seed = Nothing
      }
    , Cmd.batch
        [ Metadata.setMetadata (Metadata.metadataFromPage page English content)
        , getActions
        , Random.generate UpdateSeed Random.independentSeed
        ]
    )


getActions : Cmd Msg
getActions =
    Http.get
        { url = "/API.json"
        , expect = Http.expectJson GotActions Page.Guides.Data.actionTeaserListDecoder
        }


consentDecoder : Flags -> String
consentDecoder flags =
    case Json.Decode.decodeValue flagsConsentDecoder flags of
        Ok goodConsentedBool ->
            goodConsentedBool

        Err _ ->
            "null"


flagsConsentDecoder : Json.Decode.Decoder String
flagsConsentDecoder =
    Json.Decode.field "hasConsented" Json.Decode.string


resetViewportTop : Cmd Msg
resetViewportTop =
    Task.perform (\_ -> NoOp) (Browser.Dom.setViewport 0 0)


resetFocusTop : Cmd Msg
resetFocusTop =
    Task.attempt (\_ -> NoOp) (Browser.Dom.focus "focus-target")


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChanged url ->
            let
                newRoute : Route
                newRoute =
                    -- If not a valid route, go to index
                    -- could 404 instead depends on desired behaviour
                    Maybe.withDefault Index (Route.fromUrl url)
            in
            ( { model | page = newRoute }
            , Cmd.batch
                [ Metadata.setMetadata (Metadata.metadataFromPage newRoute model.language model.content)
                , resetFocusTop
                , resetViewportTop
                ]
            )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Browser.Navigation.pushUrl model.key (Url.toString url)
                    )

                Browser.External href ->
                    ( model
                    , Browser.Navigation.load href
                    )

        LanguageChangeRequested ->
            let
                newLanguage : Language
                newLanguage =
                    if model.language == English then
                        Welsh

                    else
                        English
            in
            ( { model | language = newLanguage }
            , Cmd.batch
                [ Metadata.setMetadata (Metadata.metadataFromPage model.page newLanguage model.content)
                , GoogleAnalytics.updateAnalytics model.cookieState.enableAnalytics
                    (GoogleAnalytics.updateAnalyticsEvent
                        { category = Route.toString model.page
                        , action = "changed language to"
                        , label = I18n.Translate.languageToString newLanguage
                        }
                    )
                ]
            )

        GotActions result ->
            case result of
                Ok list ->
                    let
                        actions : List Page.Shared.Data.Teaser
                        actions =
                            List.sortBy .title list
                    in
                    ( { model | externalActions = Success actions }, Cmd.none )

                Err _ ->
                    ( { model | externalActions = Failure }, Cmd.none )

        CookieSettingsButtonClicked ->
            ( { model | cookieState = openCookieBanner model.cookieState }, Cmd.none )

        CookiesAccepted ->
            ( { model | cookieState = updateCookieState model.cookieState True }
            , Cmd.batch
                [ GoogleAnalytics.updateAnalyticsPage (Route.toString model.page)
                , saveConsent True
                ]
            )

        CookiesDeclined ->
            ( { model | cookieState = updateCookieState model.cookieState False }
            , if model.cookieState.enableAnalytics then
                -- Have previously opted in, set to false
                saveConsent False

              else
                -- Have never opted in store nothing
                Cmd.none
            )

        SearchChanged searchResult query ->
            ( { model | search = searchResult, query = query }, Cmd.none )

        UpdateSeed seed ->
            ( { model | seed = Just seed }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )

        Print ->
            ( model, Page.Guide.View.print () )


openCookieBanner : CookieState -> CookieState
openCookieBanner oldState =
    { oldState | cookieBannerIsOpen = True }


updateCookieState : CookieState -> Bool -> CookieState
updateCookieState oldState optedIn =
    { oldState | enableAnalytics = optedIn, cookieBannerIsOpen = False }


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


viewDocument : Model -> Browser.Document Msg
viewDocument model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    { title = t SiteTitle, body = [ toUnstyled (view model) ] }


view : Model -> Html Msg
view model =
    case model.page of
        Index ->
            Theme.PageTemplate.view model (Page.Index.view model)

        Story slug ->
            let
                maybeStory : Maybe Page.Story.Data.Story
                maybeStory =
                    Page.Story.Data.storyFromSlug model.language model.content.stories slug
            in
            Theme.PageTemplate.view model <|
                case maybeStory of
                    Just story ->
                        Page.Story.View.view model.language story

                    Nothing ->
                        resourceNotFound model.language

        Guide slug ->
            let
                maybeGuide : Maybe Page.Guide.Data.Guide
                maybeGuide =
                    Page.Guide.Data.guideFromSlug model.language model.content.guides slug
            in
            Theme.PageTemplate.view model <|
                case maybeGuide of
                    Just guide ->
                        Page.Guide.View.view model.language
                            guide
                            (Page.Guide.Data.allGuidesSlugTitleList model.content.guides)
                            (Page.Story.Data.allStoryTeaserList model.content.stories)

                    Nothing ->
                        resourceNotFound model.language

        SubmitStory ->
            let
                maybePage : Maybe Page.Data.Page
                maybePage =
                    Page.Data.pageFromSlug model.language model.content.pages "share-story"
            in
            Theme.PageTemplate.view model <|
                case maybePage of
                    Just page ->
                        Page.SubmitStory.View.view model page

                    Nothing ->
                        resourceNotFound model.language

        Guides ->
            Theme.PageTemplate.view model (Page.Guides.View.view model)

        Page slug ->
            let
                maybePage : Maybe Page.Data.Page
                maybePage =
                    Page.Data.pageFromSlug model.language model.content.pages slug
            in
            Theme.PageTemplate.view model <|
                case maybePage of
                    Just page ->
                        Page.View.view page

                    Nothing ->
                        resourceNotFound model.language
