module Theme.PageTemplate exposing (view)

import CookieBanner
import Css exposing (Style, alignItems, backgroundColor, batch, center, column, displayFlex, flex2, flexBasis, flexDirection, height, int, minHeight, pct, vh, width)
import Html.Styled exposing (Html, button, div, main_, text)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Message exposing (Msg(..))
import Shared exposing (Model)
import Theme.FooterTemplate as FooterTemplate
import Theme.Global exposing (globalStyles, lightTeal, teal)


view : Model -> Html Msg -> Html Msg
view model content =
    let
        t : Key -> String
        t =
            translate model.language
    in
    div [ css [ pageWrapperStyle ] ]
        [ globalStyles
        , div [ css [ pageStyle ] ]
            [ main_ []
                [ button [ onClick LanguageChangeRequested ] [ text (t ChangeLanguage) ]
                , div []
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
        ]


pageStyle : Style
pageStyle =
    batch
        [ width (pct 100)
        ]


pageWrapperStyle : Style
pageWrapperStyle =
    batch
        [ alignItems center
        , displayFlex
        , flexDirection column
        , height (pct 100)
        , minHeight (vh 100)
        , backgroundColor teal
        ]
