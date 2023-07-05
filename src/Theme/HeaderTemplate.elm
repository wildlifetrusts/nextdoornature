module Theme.HeaderTemplate exposing (view)

import Css exposing (Style, alignItems, backgroundColor, backgroundImage, backgroundPosition2, backgroundRepeat, backgroundSize, baseline, batch, border, border3, borderRadius, boxShadow, center, color, column, display, displayFlex, em, flexDirection, flexEnd, flexStart, flexWrap, focus, fontFamilies, fontSize, fontWeight, hover, int, justifyContent, left, lineHeight, margin, margin2, marginBottom, marginRight, marginTop, minWidth, noRepeat, noWrap, none, normal, outline, padding, padding4, pct, pseudoElement, px, rem, right, row, solid, spaceBetween, textAlign, textDecoration, textDecoration3, underline, url, width, zero)
import Html.Styled exposing (Html, a, button, div, header, input, label, node, text)
import Html.Styled.Attributes exposing (attribute, css, for, href, id, placeholder, type_)
import Html.Styled.Events exposing (on, onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Json.Decode
import Message exposing (Msg(..))
import Page.Search.Data
import Route exposing (Route(..))
import Shared exposing (Model)
import Theme.FluidScale
import Theme.Global exposing (borderWrapper, centerContent, hideFromPrint, mediumTeal, purple, screenReaderOnly, teal, white, withMediaMobileUp, withMediaPrint)


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
                            a [ href (Route.toString (Search Nothing)), css [ headerBtnStyle ] ] [ text (t SearchPlaceholder) ]
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
    in
    div []
        [ label [ for "search", css [ screenReaderOnly ] ]
            [ text (t SearchPlaceholder) ]
        , node "search-input"
            [ Html.Styled.Attributes.property "searchResult" (Page.Search.Data.searchResultEncoder (Page.Search.Data.searchableTeaserListFromSearchData model.searchResult))
            , attribute "search-input" (searchableStringFromSearchData (Page.Search.Data.getTeaserListsForSearch model))
            , on "resultChanged"
                (Json.Decode.map2 Message.SearchChanged
                    (Json.Decode.at [ "target", "searchResult" ]
                        (Json.Decode.list Page.Search.Data.searchableTeaserDecoder)
                        |> Page.Search.Data.searchDataFromSearchableTeaserList
                    )
                    (Json.Decode.at [ "target", "_input", "value" ] Json.Decode.string)
                )
            ]
            [ input [ id "search", type_ "text", placeholder (t SearchPlaceholder), css [ searchInputStyle ] ] [] ]
        ]


searchableStringFromSearchData : Shared.SearchData -> String
searchableStringFromSearchData searchData =
    Page.Search.Data.searchableTeaserListFromSearchData searchData
        |> Page.Search.Data.searchTeaserListString


headerBrandStyle : Style
headerBrandStyle =
    batch
        [ Theme.FluidScale.fontSizeHeaderBrand
        , Theme.FluidScale.logoContainer
        , color white
        , fontFamilies [ "Ludicrous" ]
        , fontWeight normal
        , lineHeight (em 1)
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
        [ color white
        , hover [ textDecoration none ]
        , marginBottom (rem 0.3)
        , textAlign left
        , textDecoration none
        , withMediaMobileUp
            [ textAlign right
            ]
        ]


headerBtnStyle : Style
headerBtnStyle =
    batch
        [ color white
        , backgroundColor teal
        , border (px 0)
        , fontSize (rem 1)
        , hover
            [ textDecoration3 underline solid white
            ]
        , padding (px 0)
        , textAlign left
        , textDecoration3 underline solid mediumTeal
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
