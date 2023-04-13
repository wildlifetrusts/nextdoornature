module Theme.HeaderTemplate exposing (HeaderInfo, view)

import Css exposing (Style, batch)
import Html.Styled exposing (Html, h1, header, node, text)
import Html.Styled.Attributes exposing (css, property)
import Html.Styled.Events exposing (on)
import Json.Decode
import Json.Encode
import Message exposing (Msg)
import Shared exposing (Model)


type alias HeaderInfo =
    { content : String }


view : Model -> HeaderInfo -> Html Msg
view model headerInfo =
    header [ css [ headerStyle ] ]
        [ h1
            []
            [ text headerInfo.content
            ]
        , searchInput model
        ]


headerStyle : Style
headerStyle =
    batch
        []


searchInput : Model -> Html Msg
searchInput model =
    node "search-input"
        [ property "searchResult" <| Json.Encode.string model.search
        , on "resultChanged" <| Json.Decode.map Message.SearchChanged <| Json.Decode.at [ "target", "searchResult" ] <| Json.Decode.string
        ]
        []
