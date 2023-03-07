module Theme.PageTemplate exposing (..)

import Css exposing (Style, batch)
import Html.Styled as Html exposing (div, text)
import Html.Styled.Attributes exposing (css)


type alias Msg =
    Never

type alias PageUsingTemplate msg =
    { content : Maybe (Html.Html msg) }

view : PageUsingTemplate msg -> Html.Html msg
view pageInfo =
    div [][ 
        case pageInfo.content of
            Just pageContents ->
                div [ css [ mainStyle ] ] [ pageContents ]
            Nothing ->
                text "" 
        ]

mainStyle : Style
mainStyle =
    batch
        [
        ]
