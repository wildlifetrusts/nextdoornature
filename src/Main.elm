module Main exposing (main)

import Browser
import Html.Styled as Html exposing (..)
import I18n.Translate exposing (Language(..), translate)
import I18n.Keys exposing (Key(..))

type alias Flags =
    ()


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = viewDocument
        }


type alias Model =
    { language : Language
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( (Model English)
    , Cmd.none
    )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


viewDocument : Model -> Browser.Document Msg
viewDocument model =
    { title = (translate model.language SiteTitle), body = [toUnstyled (view model) ] }


view : Model -> Html Msg
view model =
    let
        t =
            translate model.language
    in
    h1
        []
        [ text (t IntroText)
        ]
