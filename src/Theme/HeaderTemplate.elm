module Theme.HeaderTemplate exposing (view)

import Css exposing (Style, batch, fontFamilies, fontSize, margin, rem, zero)
import Html.Styled exposing (Html, a, div, h1, header, input, label, node, text)
import Html.Styled.Attributes exposing (attribute, css, href, id, placeholder, property, type_)
import Html.Styled.Events exposing (on)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Json.Decode
import List exposing (concat)
import Message exposing (Msg)
import Page.Guide.Data
import Page.GuideTeaser
import Page.Shared.View
import Route exposing (Route(..))
import Shared exposing (Model, Request(..))


view : Model -> Html Msg
view model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    header []
        [ viewSiteTitle model.page (t SiteTitle)
        , case model.page of
            Guides ->
                searchInput model

            _ ->
                a [ href "/guides" ] [ text <| t FooterGuidesLinkText ]
        ]


viewSiteTitle : Route -> String -> Html Msg
viewSiteTitle route siteTitle =
    if route == Index then
        h1 [ css [ headerBrandStyle ] ] [ text siteTitle ]

    else
        div [ css [ headerBrandStyle ] ]
            [ a [ href "/" ]
                [ text siteTitle
                ]
            ]


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
    label []
        [ text (t SearchPlaceholder)
        , node "search-input"
            [ property "searchResult" <| Page.GuideTeaser.guideTeaserListEncoder model.search
            , attribute "search-input" <| Page.GuideTeaser.guideTeaserListString teaserList
            , on "resultChanged" <|
                Json.Decode.map Message.SearchChanged <|
                    Json.Decode.at [ "target", "searchResult" ] <|
                        Json.Decode.list Page.Shared.View.internalGuideTeaserDecoder
            ]
            [ input [ id "search", type_ "text", placeholder (t SearchPlaceholder) ] [] ]
        ]


headerBrandStyle : Style
headerBrandStyle =
    batch
        [ fontSize (rem 4)
        , fontFamilies [ "Ludicrous" ]
        , margin zero
        ]
