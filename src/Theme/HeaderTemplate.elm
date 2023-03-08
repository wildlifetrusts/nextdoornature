module Theme.HeaderTemplate exposing (..)

import Css exposing (Style, batch)
import Html.Styled exposing (Html, h1, header, text)
import Html.Styled.Attributes exposing (css)


type alias HeaderInfo =
    { content : String }


view : HeaderInfo -> Html msg
view headerInfo =
    header [ css [ headerStyle ] ]
        [ h1
            []
            [ text headerInfo.content
            ]
        ]


headerStyle : Style
headerStyle =
    batch
        []
