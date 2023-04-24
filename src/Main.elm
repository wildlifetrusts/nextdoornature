module Main exposing (Flags, main)

import Browser
import Browser.Navigation
import CookieBanner exposing (saveConsent)
import GoogleAnalytics
import Html.Styled exposing (Html, toUnstyled)
import Http
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..))
import Json.Decode
import Message exposing (Msg(..))
import Metadata
import Page.Data
import Page.Guide.Data
import Page.Guide.View
import Page.Guides
import Page.Index
import Page.Shared.Data
import Page.Shared.View exposing (actionTeaserListDecoder)
import Page.Story.Data
import Page.Story.View
import Page.View
import Route exposing (Route(..))
import Shared exposing (CookieState, Model, Request(..))
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
    in
    ( { key = key
      , page = page
      , cookieState =
            { enableAnalytics = hasConsented
            , cookieBannerIsOpen = showCookieBanner
            }
      , content = Page.Shared.Data.contentDictDecoder flags
      , language = English
      , search = []
      , externalActions = Loading
      }
    , Cmd.batch
        [ Metadata.setMetadata (Metadata.metadataFromPage page)
        , getActions
        ]
    )


getActions : Cmd Msg
getActions =
    Http.get
        { url = "/API.json"
        , expect = Http.expectJson GotActions actionTeaserListDecoder
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
            , Metadata.setMetadata (Metadata.metadataFromPage newRoute)
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
            ( if model.language == English then
                { model | language = Welsh }

              else
                { model | language = English }
            , GoogleAnalytics.updateAnalytics model.cookieState.enableAnalytics
                (GoogleAnalytics.updateAnalyticsEvent
                    { category = Route.toString model.page
                    , action = "changed language to"
                    , label = I18n.Translate.languageToString model.language
                    }
                )
            )

        GotActions result ->
            case result of
                Ok list ->
                    ( { model | externalActions = Success list }, Cmd.none )

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

        SearchChanged searchResult ->
            ( { model | search = searchResult }, Cmd.none )


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
    { title = "[cCc] App title", body = [ toUnstyled (view model) ] }


view : Model -> Html Msg
view model =
    case model.page of
        Index ->
            Theme.PageTemplate.view model (Page.Index.view model)

        Story slug ->
            let
                story =
                    Page.Story.Data.storyFromSlug model.language model.content.stories slug
            in
            Theme.PageTemplate.view model (Page.Story.View.view story)

        Guide slug ->
            let
                guide =
                    Page.Guide.Data.guideFromSlug model.language model.content.guides slug
            in
            Theme.PageTemplate.view model (Page.Guide.View.view guide)

        Guides ->
            Theme.PageTemplate.view model (Page.Guides.view model)

        Page slug ->
            let
                page =
                    Page.Data.pageFromSlug model.language model.content.pages slug
            in
            Theme.PageTemplate.view model (Page.View.view page)
