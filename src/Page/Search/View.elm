module Page.Search.View exposing (view)

import Css exposing (Style, batch, fontWeight, int, margin, padding, pct, property, rem, width)
import Html.Styled exposing (Html, a, div, h2, img, li, p, section, text, ul)
import Html.Styled.Attributes exposing (alt, attribute, css, href, id, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import List
import Message exposing (Msg)
import Page.Search.Data
import Page.Shared.Data
import Shared exposing (Model)
import Theme.Global exposing (centerContent, contentWrapper, primaryHeader, withMediaDesktopUp, withMediaMobileUp, withMediaTabletLandscapeUp, withMediaTabletPortraitUp)


view : Model -> Html Msg
view model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    div [ css [ centerContent ] ]
        [ primaryHeader [ attribute "aria-live" "alert", css [ guidesSearchTitleStyle ] ] (t SearchTitle)
        , div
            [ css [ contentWrapper ] ]
            [ viewTeaserList model.language model.query (Page.Search.Data.getTeaserListFromSearch model)
            ]
        ]


viewGuideTeaser : Page.Shared.Data.Teaser -> Html Msg
viewGuideTeaser teaser =
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
        , viewGuideTeaserSummary teaser.summary
        ]


viewGuideTeaserSummary : String -> Html Msg
viewGuideTeaserSummary summary =
    if String.length summary > 0 then
        p
            [ css [ Theme.Global.teaserRowStyle ] ]
            [ text <| limitContent summary 240 ]

    else
        text ""


viewTeaserList : Language -> String -> List Page.Shared.Data.Teaser -> Html Msg
viewTeaserList language searchString teasers =
    if List.length teasers > 0 then
        let
            sectionHeader : String
            sectionHeader =
                if String.length searchString > 0 then
                    let
                        t : Key -> String
                        t =
                            translate language
                    in
                    t (teaserListTitleKey (List.length teasers) searchString)

                else
                    ""
        in
        section []
            [ h2 [ id "guides" ] [ text sectionHeader ]
            , ul [ css [ guidesPageLayoutStyle ] ]
                (teasers
                    |> List.map
                        (\teaser -> viewGuideTeaser teaser)
                )
            ]

    else
        text ""


teaserListTitleKey : Int -> String -> Key
teaserListTitleKey length searchString =
    let
        numberOfResultsString : String
        numberOfResultsString =
            String.fromInt length
    in
    if length > 1 then
        SearchTitleFiltered numberOfResultsString searchString

    else
        SearchTitleFilteredSingleResult searchString


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


guidesSearchTitleStyle : Style
guidesSearchTitleStyle =
    batch
        [ property "hyphens" "auto"
        , withMediaMobileUp
            [ property "hyphens" "none"
            ]
        ]
