module Theme.HeaderTemplate exposing (view)

import Css exposing (Style, alignItems, baseline, batch, center, column, displayFlex, flexDirection, flexEnd, flexStart, flexWrap, fontFamilies, fontSize, justifyContent, left, margin, margin2, marginBottom, marginRight, marginTop, noWrap, rem, right, row, spaceBetween, textAlign, zero)
import Html.Styled exposing (Html, a, button, div, h1, header, input, label, node, text)
import Html.Styled.Attributes exposing (attribute, css, href, id, placeholder, property, type_)
import Html.Styled.Events exposing (on, onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Json.Decode
import List
import Message exposing (Msg(..))
import Page.Guide.Data
import Page.GuideTeaser
import Page.Shared.View
import Route exposing (Route(..))
import Shared exposing (Model, Request(..))
import Theme.Global exposing (centerContent, outerPadding, withMediaMobileUp)


view : Model -> Html Msg
view model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    header [ css [ headerContainerStyle ] ]
        [ viewSiteTitle model.page (t SiteTitle)
        , div [ css [ searchButtonsContainerStyle ] ]
            [ button [ onClick LanguageChangeRequested ]
                [ text (t ChangeLanguage) ]
            , case model.page of
                Guides ->
                    searchInput model

                _ ->
                    a [ href "/guides", css [ headerLinkStyle ] ] [ text <| t FooterGuidesLinkText ]
            ]
        ]


viewSiteTitle : Route -> String -> Html Msg
viewSiteTitle route siteTitle =
    if route == Index then
        h1 [ css [ headerBrandStyle, headerTitleStyle ] ] [ text siteTitle ]

    else
        div [ css [ headerBrandStyle, headerTitleStyle ] ]
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
                    List.concat [ Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides, list ]
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


headerContainerStyle : Style
headerContainerStyle =
    batch
        [ alignItems baseline
        , centerContent
        , displayFlex
        , flexDirection column
        , flexWrap noWrap
        , justifyContent center
        , outerPadding
        , withMediaMobileUp
            [ flexDirection row
            , justifyContent spaceBetween
            ]
        ]


searchButtonsContainerStyle : Style
searchButtonsContainerStyle =
    batch
        [ alignItems flexStart
        , displayFlex
        , flexDirection column
        , flexWrap noWrap
        , justifyContent center
        , marginTop (rem 2)
        , marginBottom (rem 0)
        , withMediaMobileUp
            [ margin2 (rem 2) (rem 0)
            , alignItems flexEnd
            ]
        ]


headerLinkStyle : Style
headerLinkStyle =
    batch
        [ textAlign left
        , withMediaMobileUp
            [ textAlign right
            ]
        ]


headerTitleStyle : Style
headerTitleStyle =
    batch
        [ marginRight (rem 3)
        ]
