module Theme.PageTemplate exposing (view)

import CookieBanner
import Css exposing (Style, backgroundColor, batch, border3, hidden, overflowX, pct, rem, solid, width)
import Html.Styled exposing (Html, div, main_)
import Html.Styled.Attributes exposing (css)
import Message exposing (Msg)
import Shared exposing (Model)
import Theme.FooterTemplate as FooterTemplate
import Theme.Global exposing (borderWrapper, globalStyles, lightTeal, teal)
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
        [ overflowX hidden
        , width (pct 100)
        ]


mainContainerStyles : Style
mainContainerStyles =
    batch
        [ borderWrapper
        , backgroundColor lightTeal
        ]
