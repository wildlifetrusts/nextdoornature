module Theme.HeaderTemplate exposing (view)

import Css exposing (Style, alignItems, backgroundColor, backgroundImage, backgroundPosition, backgroundPosition2, backgroundRepeat, backgroundSize, baseline, batch, border, border3, borderRadius, boxShadow, center, color, column, contain, display, displayFlex, em, flexDirection, flexEnd, flexStart, flexWrap, focus, fontFamilies, fontSize, fontWeight, height, inlineBlock, int, justifyContent, left, lineHeight, margin, margin2, marginBottom, marginLeft, marginRight, marginTop, minWidth, noRepeat, noWrap, none, normal, outline, padding, padding4, pct, pseudoElement, px, rem, right, row, solid, spaceBetween, textAlign, url, width, zero)
import Html.Styled exposing (Html, a, button, div, header, input, label, node, text)
import Html.Styled.Attributes exposing (attribute, css, for, href, id, placeholder, type_)
import Html.Styled.Events exposing (on, onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Json.Decode
import List
import Message exposing (Msg(..))
import Page.Search.Data
import Page.Shared.Data
import Route exposing (Route(..))
import Shared exposing (Model, Request(..))
import Theme.FluidScale
import Theme.Global exposing (borderWrapper, centerContent, hideFromPrint, purple, screenReaderOnly, teal, white, withMediaMobileUp, withMediaPrint)


view : Model -> Html Msg
view model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    header [ css [ headerOuterStyle, withMediaPrint Nothing ] ]
        [ div [ css [ centerContent ] ]
            [ div [ css [ headerContainerStyle ] ]
                [ viewSiteTitle (t SiteTitle)
                , div [ css [ searchButtonsContainerStyle, hideFromPrint ] ]
                    [ button [ css [ headerBtnStyle ], onClick LanguageChangeRequested ]
                        [ text (t ChangeLanguage) ]
                    , case model.page of
                        Search _ ->
                            searchInput model

                        _ ->
                            a [ href (Route.toString (Search (Just "#guides"))), css [ headerLinkStyle ] ] [ text (t FooterGuidesLinkText) ]
                    ]
                ]
            ]
        ]


viewSiteTitle : String -> Html Msg
viewSiteTitle siteTitle =
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

        teaserList : List Page.Shared.Data.Teaser
        teaserList =
            if model.language == Welsh then
                Page.Search.Data.teaserListFromGuideDict model.language model.content.guides

            else
                case model.externalActions of
                    Failure ->
                        Page.Search.Data.teaserListFromGuideDict model.language model.content.guides

                    Loading ->
                        Page.Search.Data.teaserListFromGuideDict model.language model.content.guides

                    Success list ->
                        List.concat [ Page.Search.Data.teaserListFromGuideDict model.language model.content.guides, list ]
    in
    div []
        [ label [ for "search", css [ screenReaderOnly ] ]
            [ text (t SearchPlaceholder) ]
        , node "search-input"
            [ Html.Styled.Attributes.property "searchResult" <| Page.Search.Data.guideTeaserListEncoder model.search
            , attribute "search-input" <| Page.Search.Data.guideTeaserListString teaserList
            , on "resultChanged" <|
                Json.Decode.map2 Message.SearchChanged (Json.Decode.at [ "target", "searchResult" ] (Json.Decode.list Page.Search.Data.internalGuideTeaserDecoder)) (Json.Decode.at [ "target", "_input", "value" ] Json.Decode.string)
            ]
            [ input [ id "search", type_ "text", placeholder (t SearchPlaceholder), css [ searchInputStyle ] ] [] ]
        ]


headerBrandStyle : Style
headerBrandStyle =
    batch
        [ Theme.FluidScale.fontSizeHeaderBrand
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
        , borderWrapper
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
                (url "/images/arrow--white.svg")
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
                (url "/images/arrow--white.svg")
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
        , padding (px 0)
        , textAlign left
        , withMediaMobileUp
            [ textAlign right
            ]
        ]


searchInputStyle : Style
searchInputStyle =
    batch
        [ backgroundImage (url "/images/arrow-right-purple.svg")
        , backgroundPosition2 (pct 95) (pct 50)
        , backgroundRepeat noRepeat
        , backgroundSize (rem 1)
        , borderRadius (rem 1.5)
        , border3 (px 2) solid purple
        , boxShadow none
        , minWidth (px 240)
        , marginTop (rem 1)
        , padding4 (rem 0.5) (rem 2) (rem 0.5) (rem 1)
        , focus
            [ outline none
            ]
        , pseudoElement "placeholder"
            [ color purple
            , fontWeight (int 700)
            ]
        ]
