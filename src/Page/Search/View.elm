module Page.Search.View exposing (view)

import Css exposing (Style, batch, fontWeight, int, margin, marginBottom, padding, pct, property, rem, width)
import Html.Styled exposing (Html, a, div, h2, h3, img, li, p, section, text, ul)
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
        , div [] (viewGuideStoryActionLists model)
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


viewGuideStoryActionLists : Model -> List (Html Msg)
viewGuideStoryActionLists model =
    let
        teaserData =
            Page.Search.Data.getTeaserListsFromSearch model
    in
    List.map (\viewList -> viewList)
        [ viewTeaserList ( "guides", GuidesHeading, teaserData.guides ) model.language model.query
        , viewTeaserList ( "stories", StoriesHeading, teaserData.stories ) model.language model.query
        , viewTeaserList ( "actions", ActionsHeading, teaserData.actions ) model.language model.query
        ]


viewTeaserList : ( String, Key, List Page.Shared.Data.Teaser ) -> Language -> String -> Html Msg
viewTeaserList ( sectionId, sectionName, teasers ) language searchString =
    if List.length teasers > 0 then
        let
            t : Key -> String
            t =
                translate language

            sectionHeader : String
            sectionHeader =
                if String.length searchString > 0 then
                    let
                        numberOfResultsString : String
                        numberOfResultsString =
                            String.fromInt (List.length teasers)
                    in
                    t (SearchTitleFiltered numberOfResultsString searchString)

                else
                    ""
        in
        section [ css [ marginBottom (rem 4) ] ]
            [ h2 [ id sectionId ] [ text (t sectionName) ]
            , h3 [] [ text sectionHeader ]
            , ul [ css [ guidesPageLayoutStyle ] ]
                (teasers
                    |> List.map
                        (\teaser -> viewGuideTeaser teaser)
                )
            ]

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


guidesSearchTitleStyle : Style
guidesSearchTitleStyle =
    batch
        [ property "hyphens" "auto"
        , withMediaMobileUp
            [ property "hyphens" "none"
            ]
        ]
