module Theme.PageTemplate exposing (..)

import Css exposing (Style, batch)
import Html.Styled exposing (Html, button, div, main_, p, text)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Route exposing (Route(..))
import Shared exposing (Msg(..))
import Theme.FooterTemplate as FooterTemplate
import Theme.HeaderTemplate as HeaderTemplate


type alias Title =
    Key


type alias PageInfo =
    { language : Language, title : Key }


view : PageInfo -> Html Msg
view pageInfo =
    let
        t =
            translate pageInfo.language
    in
    div [ css [ defaultPageStyle ] ]
        [ HeaderTemplate.view { content = t pageInfo.title }
        , main_ [ css [ mainStyle ] ]
            [ button [ onClick LanguageChangeRequested ] [ text (t ChangeLanguage) ]
            , p [] [ text (t WelcomeP1) ]
            , p [] [ text (t WelcomeP2) ]
            , p [] [ text (t WelcomeP3) ]
            ]
        , FooterTemplate.view
        ]


mainStyle : Style
mainStyle =
    batch
        []


defaultPageStyle : Style
defaultPageStyle =
    batch
        []
