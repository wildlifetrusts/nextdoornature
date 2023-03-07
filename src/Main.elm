module Main exposing (main)

import Browser
import Browser.Dom
import Browser.Navigation
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes exposing (href)
import Html.Styled.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Route exposing (Route(..))
import Url


type alias Flags =
    ()


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


type alias Model =
    { key : Browser.Navigation.Key
    , page : Route
    , language : Language
    }


init : Flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        maybeRoute =
            Route.fromUrl url
    in
    ( { key = key
      , page = Maybe.withDefault Index maybeRoute
      }
    , Cmd.none
    )


type Msg
    = UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest
    | ToggleLanguage


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChanged url ->
            let
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

        ToggleLanguage ->
            ( if model.language == English then
                Model Welsh

              else
                Model English
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


viewDocument : Model -> Browser.Document Msg
viewDocument model =
    { title = translate model.language SiteTitle, body = [ toUnstyled (view model) ] }


view : Model -> Html Msg
view model =
    let
        t =
            translate model.language
    in
    case model.page of
        Index ->
            div []
                [ h1 [] [ text (t IntroText) ]
                , button [ onClick ToggleLanguage ] [ text (t ChangeLanguage) ]
                ]
