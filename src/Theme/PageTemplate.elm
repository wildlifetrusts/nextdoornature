module Theme.PageTemplate exposing (..)

import Css exposing (Style, batch)
import Html.Styled exposing (Html, button, div, h1, main_, p, text)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Route exposing (Route(..))
import Shared exposing (Model, Msg(..))
import Theme.FooterTemplate as FooterTemplate
import Theme.HeaderTemplate as HeaderTemplate


type alias PageInfo =
    { title : String, mainContent : String }


view : Model -> Html Msg
view model =
    div [ css [ defaultPageStyle ] ]
        [ HeaderTemplate.view { content = "[cCc] Header" }
        , main_ [ css [ mainStyle ] ]
            [ languageSelector model ]
        , FooterTemplate.view
        ]


languageSelector : Model -> Html Msg
languageSelector model =
    let
        t =
            translate model.language
    in
    case model.page of
        Index ->
            div []
                [ p [] [ text (t PageTitle) ]
                , button [ onClick LanguageChangeRequested ] [ text (t ChangeLanguage) ]
                ]


mainStyle : Style
mainStyle =
    batch
        []


defaultPageStyle : Style
defaultPageStyle =
    batch
        []
