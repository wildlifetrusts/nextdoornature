module Page.Search.View exposing (homePageLayoutStyle, view, viewTeaserList)

import Css exposing (Style, batch, fontWeight, int, margin, padding, pct, property, rem, width)
import Html.Styled exposing (Html, a, div, img, li, p, text, ul)
import Html.Styled.Attributes exposing (alt, attribute, css, href, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import List
import Message exposing (Msg)
import Page.Search.Data
import Page.Shared.Data
import Shared exposing (Model, Request(..))
import Theme.Global exposing (centerContent, contentWrapper, primaryHeader, withMediaDesktopUp, withMediaMobileUp, withMediaTabletLandscapeUp, withMediaTabletPortraitUp)


view : Model -> Html Msg
view model =
    let
        t : Key -> String
        t =
            translate model.language

        teaserList : List Page.Shared.Data.Teaser
        teaserList =
            if String.length model.query > 0 then
                model.search

            else if model.language == Welsh then
                Page.Search.Data.teaserListFromGuideDict model.language model.content.guides

            else
                case model.externalActions of
                    Failure ->
                        Page.Search.Data.teaserListFromGuideDict model.language model.content.guides

                    Loading ->
                        Page.Search.Data.teaserListFromGuideDict model.language model.content.guides

                    Success list ->
                        List.concat [ Page.Search.Data.teaserListFromGuideDict model.language model.content.guides, list ]

        headerText : String
        headerText =
            if String.length model.query > 0 then
                t <| SearchTitleFiltered (String.fromInt <| List.length model.search) model.query

            else
                t SearchTitle
    in
    div [ css [ centerContent ] ]
        [ primaryHeader [ attribute "aria-live" "alert", css [ guidesSearchTitleStyle ] ] headerText
        , div
            [ css [ contentWrapper ] ]
            [ viewTeaserList True guidesPageLayoutStyle teaserList
            ]
        ]


viewGuideTeaser : Bool -> Page.Shared.Data.Teaser -> Html Msg
viewGuideTeaser includeSummary teaser =
    let
        image : Page.Shared.Data.TeaserImage
        image =
            case teaser.maybeImage of
                Just anImage ->
                    anImage

                Nothing ->
                    Page.Shared.Data.defaultTeaserImage
    in
    li [ css [ Theme.Global.teaserContainerStyle ] ]
        [ img
            [ alt image.alt
            , src image.src
            , css
                [ Theme.Global.teaserImageStyle
                ]
            ]
            []
        , p [ css [ Theme.Global.teaserRowStyle ] ]
            [ a [ css [ fontWeight (int 600) ], href teaser.url ] [ text teaser.title ] ]
        , if includeSummary then
            viewGuideTeaserSummary teaser.summary

          else
            text ""
        ]


viewGuideTeaserSummary : String -> Html Msg
viewGuideTeaserSummary summary =
    if String.length summary > 0 then
        p
            [ css [ Theme.Global.teaserRowStyle ] ]
            [ text <| limitContent summary 240 ]

    else
        text ""


viewTeaserList : Bool -> Style -> List Page.Shared.Data.Teaser -> Html Msg
viewTeaserList includeSummary style teasers =
    if List.length teasers > 0 then
        ul [ css [ style ] ]
            (teasers
                |> List.map
                    (\teaser -> viewGuideTeaser includeSummary teaser)
            )

    else
        text ""


limitContent : String -> Int -> String
limitContent summary limit =
    if String.length summary > limit then
        summary
            |> String.slice 0 (limit - 3)
            |> String.padRight limit '.'

    else
        summary


guidesPageLayoutStyle : Style
guidesPageLayoutStyle =
    batch
        [ property "display" "grid"
        , margin (rem 0)
        , padding (rem 0)
        , property "grid-template-columns" "repeat(2, 1fr)"
        , property "gap" "1rem"
        , width (pct 100)
        , withMediaDesktopUp
            [ property "grid-template-columns" "repeat(6, 1fr)"
            , property "gap" "2rem"
            ]
        , withMediaTabletLandscapeUp
            [ property "grid-template-columns" "repeat(5, 1fr)"
            ]
        , withMediaTabletPortraitUp
            [ property "grid-template-columns" "repeat(4, 1fr)"
            , property "gap" "1.5rem"
            ]
        , withMediaMobileUp
            [ property "grid-template-columns" "repeat(3, 1fr)"
            ]
        ]


homePageLayoutStyle : Style
homePageLayoutStyle =
    batch
        [ property "display" "grid"
        , margin (rem 0)
        , padding (rem 0)
        , property "grid-template-columns" "repeat(2, 1fr)"
        , property "gap" "1rem"
        , width (pct 100)
        ]


guidesSearchTitleStyle : Style
guidesSearchTitleStyle =
    batch
        [ property "hyphens" "auto"
        , withMediaMobileUp
            [ property "hyphens" "none"
            ]
        ]
