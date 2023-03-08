module Theme.HeaderTemplate exposing (..)

import Css exposing (Style, batch)
import Html.Styled as Html exposing (Html, header)
import Html.Styled.Attributes exposing (css)


type alias PageUsingTemplate msg =
    { content : Html msg }


view : PageUsingTemplate msg -> Html.Html msg
view headerInfo =
    header [ css [ headerStyle ] ] [ headerInfo.content ]


headerStyle : Style
headerStyle =
    batch
        []
