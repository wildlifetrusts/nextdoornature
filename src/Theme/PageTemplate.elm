module Theme.PageTemplate exposing (view)

import CookieBanner
import Css exposing (Style, backgroundColor, batch, hidden, overflowX, pct, width)
import Html.Styled exposing (Html, button, div, main_, text)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Message exposing (Msg(..))
import Shared exposing (Model)
import Theme.FooterTemplate as FooterTemplate
import Theme.Global exposing (centerContent, globalStyles, lightTeal, pageWrapperStyle)


view : Model -> Html Msg -> Html Msg
view model content =
    let
        t : Key -> String
        t =
            translate model.language
    in
    div []
        [ globalStyles
        , div [ css [ mainStyle ] ]
            [ main_ [ css [ centerContent ] ]
                [ button [ onClick LanguageChangeRequested ] [ text (t ChangeLanguage) ]
                , div [ css [ pageWrapperStyle ] ]
                    [ content
                    ]
                ]
            ]
        , FooterTemplate.view model.language
        , CookieBanner.viewCookieBanner model.language model.cookieState
        ]


mainStyle : Style
mainStyle =
    batch
        [ backgroundColor lightTeal
        , overflowX hidden
        , width (pct 100)
        ]
