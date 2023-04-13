module Theme.HeaderTemplate exposing (HeaderInfo, view)

import Css exposing (Style, batch)
import Html.Styled exposing (Attribute, Html, h1, header, node, text)
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
        , searchInput [] []
        ]


headerStyle : Style
headerStyle =
    batch
        []


searchInput : List (Attribute msg) -> List (Html msg) -> Html msg
searchInput atributes children =
    node "search-input" atributes children
