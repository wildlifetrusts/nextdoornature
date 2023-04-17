module Theme.HeaderTemplate exposing (HeaderInfo, view)

import Css exposing (Style, batch)
import Html.Styled exposing (Html, h1, header, input, node, text)
import Html.Styled.Attributes exposing (attribute, css, property, type_)
import Html.Styled.Events exposing (on)
import I18n.Translate exposing (Language(..))
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
        , attribute "language" <|
            case model.language of
                English ->
                    "English"

                Welsh ->
                    "Welsh"
        , on "resultChanged" <| Json.Decode.map Message.SearchChanged <| Json.Decode.at [ "target", "searchResult" ] <| Json.Decode.string
        ]
        [ input [ type_ "text" ] [] ]
