module Theme.PageTemplate exposing (..)

import Css exposing (Style, batch)
import Html.Styled as Html exposing (Html, main_)
import Html.Styled.Attributes exposing (css)
import Theme.FooterTemplate as FooterTemplate
import Theme.HeaderTemplate as HeaderTemplate


type alias PageUsingTemplate msg =
    { headerContent : Html msg, mainContent : Html msg, footerContent : Html msg }


view : PageUsingTemplate msg -> List (Html.Html msg)
view pageInfo =
    [ HeaderTemplate.view { content = pageInfo.headerContent }
    , main_ [ css [ mainStyle ] ] [ pageInfo.mainContent ]
    , FooterTemplate.view { content = pageInfo.footerContent }
    ]


mainStyle : Style
mainStyle =
    batch
        []
