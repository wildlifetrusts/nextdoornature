module Theme.PageTemplate exposing (view)

import CookieBanner
import Css exposing (Style, backgroundColor, batch, hidden, overflowX, pct, width)
import Html.Styled exposing (Html, div, main_)
import Html.Styled.Attributes exposing (css)
import I18n.Keys exposing (Key(..))
import Message exposing (Msg(..))
import Shared exposing (Model)
import Theme.FooterTemplate as FooterTemplate
import Theme.Global exposing (centerContent, globalStyles, lightTeal, mainContainerStyles)
import Theme.HeaderTemplate as HeaderTemplate


view : Model -> Html Msg -> Html Msg
view model content =
    div []
        [ globalStyles
        , div
            [ css [ pageWrapperStyles ] ]
            [ HeaderTemplate.view model
            , main_ [ css [ mainContainerStyles ] ]
                [ content
                ]
            , FooterTemplate.view model.language
            , CookieBanner.viewCookieBanner model.language model.cookieState
            ]
        ]


pageWrapperStyles : Style
pageWrapperStyles =
    batch
        [ backgroundColor lightTeal
        , overflowX hidden
        , width (pct 100)
        ]
