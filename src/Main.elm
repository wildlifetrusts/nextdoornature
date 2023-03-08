module Main exposing (main)

import Browser
import Html.Styled as Html exposing (..)
import Theme.PageTemplate as PageTemplate


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
    {}


init : () -> ( Model, Cmd Msg )
init _ =
    ( {}
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
    { title = "[cCc] App title", body = List.map (\item -> toUnstyled item) (view model) }


view : Model -> List (Html Msg)
view model =
    PageTemplate.view { headerContent = headerView, mainContent = mainView, footerContent = footerView }


mainView : Html Msg
mainView =
    p
        []
        [ text "[cCc] Main template"
        ]


footerView : Html Msg
footerView =
    h2
        []
        [ text "[cCc] Footer"
        ]


headerView : Html Msg
headerView =
    h1
        []
        [ text "[cCc] Header"
        ]
