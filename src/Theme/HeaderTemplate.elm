module Theme.HeaderTemplate exposing (view)

import Css exposing (Style, absolute, alignItems, backgroundColor, backgroundImage, backgroundPosition, backgroundRepeat, backgroundSize, baseline, batch, border, border3, borderRadius, bottom, boxShadow, center, color, column, contain, display, displayFlex, em, flexDirection, flexEnd, flexStart, flexWrap, focus, fontFamilies, fontSize, fontWeight, height, inlineBlock, int, justifyContent, left, lineHeight, margin, margin2, margin4, marginBottom, marginLeft, marginRight, marginTop, minWidth, noRepeat, noWrap, none, normal, outline, padding, padding4, pct, position, pseudoElement, px, relative, rem, right, row, solid, spaceBetween, textAlign, top, url, width, zero)
import Html.Styled exposing (Html, a, button, div, h1, header, img, input, label, node, text)
import Html.Styled.Attributes exposing (attribute, css, href, id, placeholder, src, type_)
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
import Theme.FluidScale
import Theme.Global exposing (centerContent, purple, teal, white, withMediaMobileUp)


view : Model -> Html Msg
view model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    header [ css [ headerOuterStyle ] ]
        [ div [ css [ centerContent ] ]
            [ div [ css [ headerContainerStyle ] ]
                [ viewSiteTitle model.page (t SiteTitle)
                , div [ css [ searchButtonsContainerStyle ] ]
                    [ button [ css [ headerBtnStyle ], onClick LanguageChangeRequested ]
                        [ text (t ChangeLanguage) ]
                    , case model.page of
                        Guides ->
                            searchInput model

                        _ ->
                            a [ href (Route.toString Guides), css [ headerLinkStyle ] ] [ text (t FooterGuidesLinkText) ]
                    ]
                ]
            ]
        ]


viewSiteTitle : Route -> String -> Html Msg
viewSiteTitle route siteTitle =
    if route == Index then
        h1 [ css [ headerBrandStyle ] ] [ text siteTitle ]

    else
        div [ css [ headerBrandStyle ] ]
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
        t : Key -> String
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
    label [ css [ searchStyle ] ]
        [ text (t SearchPlaceholder)
        , node "search-input"
            [ Html.Styled.Attributes.property "searchResult" <| Page.GuideTeaser.guideTeaserListEncoder model.search
            , attribute "search-input" <| Page.GuideTeaser.guideTeaserListString teaserList
            , on "resultChanged" <|
                Json.Decode.map Message.SearchChanged <|
                    Json.Decode.at [ "target", "searchResult" ] <|
                        Json.Decode.list Page.Shared.View.internalGuideTeaserDecoder
            ]
            [ input [ id "search", type_ "text", placeholder (t SearchPlaceholder), css [ searchInputStyle ] ] [] ]
        , img [ src "/images/arrow-right-purple.svg", css [ arrowStyle ] ] []
        ]


headerBrandStyle : Style
headerBrandStyle =
    batch
        [ Theme.FluidScale.fontSize5
        , Theme.FluidScale.logoContainer
        , color white
        , fontFamilies [ "Ludicrous" ]
        , fontWeight normal
        , lineHeight (em 1.2)
        , margin zero
        , withMediaMobileUp
            [ marginRight (rem 3) ]
        ]


headerOuterStyle : Style
headerOuterStyle =
    batch
        [ backgroundColor teal
        , color white
        ]


headerContainerStyle : Style
headerContainerStyle =
    batch
        [ alignItems baseline
        , displayFlex
        , flexDirection column
        , flexWrap noWrap
        , justifyContent center
        , width (pct 100)
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


searchStyle : Style
searchStyle =
    batch
        [ color white
        , margin4 (rem 0.5) (rem 0) (rem 0.5) (rem 0.5)
        , height (rem 2)
        , position relative
        ]


arrowStyle : Style
arrowStyle =
    batch
        [ bottom (px 0)
        , height (rem 1)
        , padding (rem 0.75)
        , position absolute
        , right (px 0)
        , top (px 0)
        ]


searchInputStyle : Style
searchInputStyle =
    batch
        [ borderRadius (rem 1.5)
        , border3 (px 3) solid purple
        , boxShadow none
        , height (rem 1)
        , minWidth (px 240)
        , padding4 (rem 0.5) (rem 2) (rem 0.5) (rem 1)
        , focus
            [ outline none
            ]
        , pseudoElement "placeholder"
            [ color purple
            , fontWeight (int 700)
            ]
        ]
