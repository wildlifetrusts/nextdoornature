module Page.Guides.View exposing (view, viewTeaserList)

import Html.Styled exposing (Html, a, div, h1, img, li, p, text, ul)
import Html.Styled.Attributes exposing (alt, attribute, css, href, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import List
import Message exposing (Msg)
import Page.Guides.Data
import Page.Shared.Data
import Shared exposing (Model, Request(..))
import Theme.Global exposing (centerContent, contentWrapper)


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
                Page.Guides.Data.teaserListFromGuideDict model.language model.content.guides

            else
                case model.externalActions of
                    Failure ->
                        Page.Guides.Data.teaserListFromGuideDict model.language model.content.guides

                    Loading ->
                        Page.Guides.Data.teaserListFromGuideDict model.language model.content.guides

                    Success list ->
                        List.concat [ Page.Guides.Data.teaserListFromGuideDict model.language model.content.guides, list ]
    in
    div [ css [ centerContent ] ]
        [ h1 [ attribute "aria-live" "polite" ]
            [ text <|
                if String.length model.query > 0 then
                    t <| GuidesTitleFiltered (String.fromInt <| List.length model.search) model.query

                else
                    t GuidesTitle
            ]
        , div
            [ css [ contentWrapper ] ]
            [ viewTeaserList True teaserList
            ]
        ]


viewGuideTeaser : Bool -> Page.Shared.Data.Teaser -> Html Msg
viewGuideTeaser includeSummary teaser =
    let
        image : Page.Shared.Data.TeaserImage
        image =
            case teaser.maybeImage of
                Just i ->
                    i

                Nothing ->
                    Page.Shared.Data.defaultTeaserImage
    in
    li [ css [ Theme.Global.teaserContainerStyle ] ]
        [ img
            [ alt image.alt
            , src image.src
            , css
                [ Theme.Global.roundedCornerStyle
                , Theme.Global.teaserImageStyle
                ]
            ]
            []
        , p [ css [ Theme.Global.teaserRowStyle ] ]
            [ a [ href teaser.url ] [ text teaser.title ] ]
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


viewTeaserList : Bool -> List Page.Shared.Data.Teaser -> Html Msg
viewTeaserList includeSummary teasers =
    if List.length teasers > 0 then
        ul [ css [ Theme.Global.teasersContainerStyle ] ]
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
