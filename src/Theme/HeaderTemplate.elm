module Theme.HeaderTemplate exposing (HeaderInfo, view)

import Css exposing (Style, batch)
import Html.Styled exposing (Html, h1, header, input, node, text)
import Html.Styled.Attributes exposing (attribute, css, placeholder, property, type_)
import Html.Styled.Events exposing (on)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..))
import Json.Decode
import Json.Encode
import List exposing (concat, length)
import Message exposing (Msg)
import Page.Guide.Data
import Page.GuideTeaser
import Page.Shared.View exposing (actionTeaserListDecoder)
import Shared exposing (Model, Request(..))


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
    let
        t =
            I18n.Translate.translate model.language

        teaserList : List Page.GuideTeaser.GuideTeaser
        teaserList =
            case model.externalActions of
                Failure ->
                    Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides

                Loading ->
                    Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides

                Success list ->
                    concat [ Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides, list ]
    in
    node "search-input"
        [ property "searchResult" <| Page.GuideTeaser.guideTeaserListEncoder model.search
        , attribute "search-input" <| Page.GuideTeaser.guideTeaserListString teaserList
        , on "resultChanged" <|
            Json.Decode.map Message.SearchChanged <|
                Json.Decode.at [ "target", "searchResult" ] <|
                    Json.Decode.list Page.Shared.View.internalGuideTeaserDecoder
        ]
        [ input [ type_ "text", placeholder (t SearchPlaceholder) ] [] ]
