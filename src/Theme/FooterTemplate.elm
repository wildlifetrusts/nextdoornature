module Theme.FooterTemplate exposing (..)

import Css exposing (Style, batch)
import Html.Styled as Html exposing (Html, footer)
import Html.Styled.Attributes exposing (css)


type alias PageUsingTemplate msg =
    { content : Html msg }


view : PageUsingTemplate msg -> Html.Html msg
view footerInfo =
    footer [ css [ footerStyle ] ] [ footerInfo.content ]


footerStyle : Style
footerStyle =
    batch
        []
