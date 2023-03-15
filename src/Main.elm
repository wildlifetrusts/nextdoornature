module Main exposing (Flags, main)

import Browser
import Browser.Navigation
import Html.Styled exposing (Html, toUnstyled)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..))
import Json.Decode
import Message exposing (Msg(..))
import Page.Guide.Data
import Page.Guide.View
import Page.Index
import Page.Shared.Data
import Page.Stories.Data
import Page.Stories.View
import Route exposing (Route(..))
import Shared exposing (CookieState, Model)
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
    in
    ( { key = key
      , page = Maybe.withDefault Index maybeRoute
      , cookieState =
            { enableAnalytics = False
            , cookieBannerIsOpen = True
            }
      , content = Page.Shared.Data.contentDictDecoder flags
      , language = English
      }
    , Cmd.none
    )


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
            ( { model | page = newRoute }, Cmd.none )

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
            , Cmd.none
            )

        CookiesAccepted ->
            ( { model | cookieState = updateCookieState model.cookieState True }, Cmd.none )

        CookiesDeclined ->
            ( { model | cookieState = updateCookieState model.cookieState False }, Cmd.none )


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
            Theme.PageTemplate.view model
                { title = SiteTitle, content = Page.Index.view model }

        Story slug ->
            Theme.PageTemplate.view model
                { title = StoryTitle
                , content =
                    Page.Stories.View.view (Page.Stories.Data.storyFromSlug model.language model.content.stories slug)
                }

        Guide slug ->
            Theme.PageTemplate.view model
                { title = GuideTitle
                , content =
                    Page.Guide.View.view (Page.Guide.Data.guideFromSlug model.language model.content.guides slug)
                }
