module Theme.PageTemplate exposing (PageInfo, view)

import Css exposing (Style, alignItems, auto, batch, center, column, displayFlex, flex2, flexBasis, flexDirection, height, int, minHeight, pct, vh)
import Html.Styled exposing (Html, button, div, main_, text)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Shared exposing (Msg(..))
import Theme.FooterTemplate as FooterTemplate
import Theme.HeaderTemplate as HeaderTemplate


type alias PageInfo =
    { language : Language, title : Key }


view : PageInfo -> Html Msg
view pageInfo =
    let
        t : Key -> String
        t =
            translate pageInfo.language
    in
    div [ css [ pageAndFooterStyle ] ]
        [ div [ css [ pageStyle ] ]
            [ HeaderTemplate.view { content = t pageInfo.title }
            , main_ [ css [ mainStyle ] ]
                [ button [ onClick LanguageChangeRequested ] [ text (t ChangeLanguage) ]
                ]
            ]
        , FooterTemplate.view pageInfo.language
        ]


mainStyle : Style
mainStyle =
    batch
        []


pageStyle : Style
pageStyle =
    batch
        [ flex2 (int 1) (int 0), flexBasis auto ]


pageAndFooterStyle : Style
pageAndFooterStyle =
    batch
        [ alignItems center
        , displayFlex
        , flexDirection column
        , height (pct 100)
        , minHeight (vh 100)
        ]
