module Theme.HeaderTemplate exposing (view)

import Css exposing (FontWeight, Style, alignItems, auto, backgroundColor, backgroundImage, backgroundPosition, backgroundPosition2, backgroundRepeat, backgroundSize, baseline, batch, border, center, color, column, contain, display, displayFlex, em, flexDirection, flexEnd, flexStart, flexWrap, fontFamilies, fontSize, fontWeight, height, inlineBlock, int, justifyContent, left, lineHeight, margin, margin2, marginBottom, marginLeft, marginRight, marginTop, maxWidth, noRepeat, noWrap, none, normal, padding, pct, property, pseudoElement, px, rem, right, row, spaceBetween, textAlign, textDecoration, url, width, zero)
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
import Theme.Global exposing (centerContent, outerPadding, teal, white, withMediaMobileUp)


view : Model -> Html Msg
view model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    header [ css [ headerStyle ] ]
        [ div [ css [ headerContainerStyle ] ]
            [ viewSiteTitle model.page (t SiteTitle)
            , div [ css [ searchButtonsContainerStyle ] ]
                [ button [ css [ headerBtnStyle ], onClick LanguageChangeRequested ]
                    [ text (t ChangeLanguage) ]
                , case model.page of
                    Guides ->
                        searchInput model

                    _ ->
                        a [ href "/guides", css [ headerLinkStyle ] ] [ text <| t FooterGuidesLinkText ]
                ]
            ]
        ]


viewSiteTitle : Route -> String -> Html Msg
viewSiteTitle route siteTitle =
    if route == Index then
        h1 [ css [ headerBrandStyle, headerTitleStyle ] ] [ text siteTitle ]

    else
        div [ css [ headerBrandStyle, headerTitleStyle ] ]
            [ a
                [ href "/"
                , css
                    [ headerLinkStyle
                    , pseudoElement "after"
                        [ display none ]
                    ]
                ]
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
            if model.language == Welsh then
                Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides

            else
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
            [ Html.Styled.Attributes.property "searchResult" <| Page.GuideTeaser.guideTeaserListEncoder model.search
            , attribute "search-input" <| Page.GuideTeaser.guideTeaserListString teaserList
            , on "resultChanged" <|
                Json.Decode.map Message.SearchChanged <|
                    Json.Decode.at [ "target", "searchResult" ] <|
                        Json.Decode.list Page.Shared.View.internalGuideTeaserDecoder
            ]
            [ input [ id "search", type_ "text", placeholder (t SearchPlaceholder) ] [] ]
        ]


headerStyle : Style
headerStyle =
    batch
        [ backgroundColor teal
        , color white
        ]


headerBrandStyle : Style
headerBrandStyle =
    batch
        [ fontSize (rem 4)
        , fontFamilies [ "Ludicrous" ]
        , lineHeight (rem 4)
        , margin zero
        , color white
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
        , marginBottom (rem 0.3)
        , withMediaMobileUp
            [ margin2 (rem 2) (rem 0)
            , alignItems flexEnd
            ]
        ]


headerLinkStyle : Style
headerLinkStyle =
    batch
        [ pseudoElement "after"
            [ backgroundImage
                (url "images/arrow--white.svg")
            , backgroundSize contain
            , backgroundPosition center
            , backgroundRepeat noRepeat
            , display inlineBlock
            , Css.property "content" "' '"
            , height (em 1)
            , width (em 1.2)
            , marginLeft (rem 0.3)
            ]
        , color white
        , marginBottom (rem 0.3)
        , textAlign left
        , withMediaMobileUp
            [ textAlign right
            ]
        ]


headerBtnStyle : Style
headerBtnStyle =
    batch
        [ pseudoElement "after"
            [ backgroundImage
                (url "images/arrow--white.svg")
            , backgroundSize contain
            , backgroundPosition center
            , backgroundRepeat noRepeat
            , display inlineBlock
            , Css.property "content" "' '"
            , height (em 1)
            , width (em 1.2)
            , marginLeft (em 0.3)
            ]
        , color white
        , backgroundColor teal
        , border (px 0)
        , fontSize (rem 1)
        , marginBottom (rem 0.3)
        , padding (px 0)
        , textAlign left
        , withMediaMobileUp
            [ textAlign right
            ]
        ]


headerTitleStyle : Style
headerTitleStyle =
    batch
        [ fontWeight normal
        , maxWidth (px 336)
        , withMediaMobileUp
            [ marginRight (rem 3) ]
        ]
