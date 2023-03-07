module Theme.PageTemplate exposing (..)

import Css exposing (Style, batch)
import Html.Styled as Html exposing (Html, div)
import Html.Styled.Attributes exposing (css)

type alias PageUsingTemplate msg =
    { content : Html msg }


view : PageUsingTemplate msg -> Html.Html msg
view pageInfo =
    div [ css [ mainStyle ] ] [ pageInfo.content ]


mainStyle : Style
mainStyle =
    batch
        []
