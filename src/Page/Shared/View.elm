module Page.Shared.View exposing (AudioMeta, VideoMeta, actionTeaserDecoder, actionTeaserListDecoder, audioDecoder, defaultTeaserImg, guideTeaserDecoder, imageDecoder, interalGuideTeaserListDecoder, internalGuideTeaserDecoder, videoDecoder, viewAudio, viewGuideTeaserList, viewVideo)

import Html.Styled exposing (Html, a, div, iframe, img, li, p, text, ul)
import Html.Styled.Attributes exposing (alt, attribute, autoplay, css, href, src, title)
import Json.Decode exposing (Decoder)
import List exposing (map, sortBy)
import Message exposing (Msg)
import Page.GuideTeaser
import String exposing (length, padRight)
import Theme.Global exposing (roundedCornerStyle, teaserContainerStyle, teaserImageStyle, teaserRowStyle, teasersContainerStyle)


type alias AudioMeta =
    { title : String
    , src : String
    }


audioDecoder : Json.Decode.Decoder AudioMeta
audioDecoder =
    Json.Decode.map2 AudioMeta
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "src" Json.Decode.string)


type alias VideoMeta =
    { title : String
    , src : String
    }


videoDecoder : Json.Decode.Decoder VideoMeta
videoDecoder =
    Json.Decode.map2 VideoMeta
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "src" Json.Decode.string)


imageDecoder : Decoder Page.GuideTeaser.Image
imageDecoder =
    Json.Decode.map2 Page.GuideTeaser.Image
        (Json.Decode.field "src" Json.Decode.string)
        (Json.Decode.field "alt" Json.Decode.string)


guideTeaserDecoder : Json.Decode.Decoder Page.GuideTeaser.GuideTeaser
guideTeaserDecoder =
    Json.Decode.map4 Page.GuideTeaser.GuideTeaser
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "basename" Json.Decode.string)
        (Json.Decode.field "summary" Json.Decode.string)
        (Json.Decode.maybe (Json.Decode.field "image" imageDecoder))


internalGuideTeaserDecoder : Json.Decode.Decoder Page.GuideTeaser.GuideTeaser
internalGuideTeaserDecoder =
    Json.Decode.map4 Page.GuideTeaser.GuideTeaser
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "url" Json.Decode.string)
        (Json.Decode.field "summary" Json.Decode.string)
        (Json.Decode.maybe (Json.Decode.field "maybeImage" imageDecoder))


interalGuideTeaserListDecoder : Json.Decode.Decoder (List Page.GuideTeaser.GuideTeaser)
interalGuideTeaserListDecoder =
    Json.Decode.list internalGuideTeaserDecoder


actionTeaserDecoder : Json.Decode.Decoder Page.GuideTeaser.GuideTeaser
actionTeaserDecoder =
    Json.Decode.map4 Page.GuideTeaser.GuideTeaser
        (Json.Decode.at [ "attributes", "title" ] Json.Decode.string)
        (Json.Decode.at [ "attributes", "path", "alias" ] Json.Decode.string
            |> Json.Decode.andThen (\url -> Json.Decode.succeed ("https://www.wildlifetrusts.org" ++ url))
        )
        (Json.Decode.at [ "attributes", "field_action_summary", "value" ] Json.Decode.string)
        (Json.Decode.maybe (Json.Decode.field "image" imageDecoder))


actionTeaserListDecoder : Json.Decode.Decoder (List Page.GuideTeaser.GuideTeaser)
actionTeaserListDecoder =
    Json.Decode.field "data" <| Json.Decode.list actionTeaserDecoder


viewVideo : VideoMeta -> Html Msg
viewVideo videoMeta =
    div []
        [ iframe
            [ src videoMeta.src
            , attribute "frameborder" "0"
            , attribute "allowfullscreen" "true"
            , autoplay False
            , title videoMeta.title
            , css [ Theme.Global.embeddedVideoStyle ]
            ]
            []
        ]


viewAudio : AudioMeta -> Html Msg
viewAudio _ =
    div
        [ css [ Theme.Global.embeddedVideoStyle ]
        ]
        [ text "[fFf] render audio player" ]


limitContent : String -> Int -> String
limitContent summary limit =
    if length summary > limit then
        summary
            |> String.slice 0 (limit - 3)
            |> padRight limit '.'

    else
        summary


defaultTeaserImg : Page.GuideTeaser.Image
defaultTeaserImg =
    { src = "/images/wildlife-trust-logo.png"

    -- If it's a placeholder, alt probably not meaningful
    , alt = ""
    }


viewGuideTeaser : Bool -> Page.GuideTeaser.GuideTeaser -> Html Msg
viewGuideTeaser includeSummary teaser =
    let
        image : Page.GuideTeaser.Image
        image =
            case teaser.maybeImage of
                Just i ->
                    i

                Nothing ->
                    defaultTeaserImg
    in
    li [ css [ teaserContainerStyle ] ]
        [ img
            [ alt image.alt
            , src image.src
            , css
                [ roundedCornerStyle
                , teaserImageStyle
                ]
            ]
            []
        , p [ css [ teaserRowStyle ] ]
            [ a [ href teaser.url ] [ text teaser.title ] ]
        , if includeSummary then
            viewGuideTeaserSummary teaser.summary

          else
            text ""
        ]


viewGuideTeaserSummary : String -> Html Msg
viewGuideTeaserSummary summary =
    if length summary > 0 then
        p
            [ css [ teaserRowStyle ] ]
            [ text <| limitContent summary 240 ]

    else
        text ""


viewGuideTeaserList : Bool -> List Page.GuideTeaser.GuideTeaser -> Html Msg
viewGuideTeaserList includeSummary teasers =
    if List.length teasers > 0 then
        ul [ css [ teasersContainerStyle ] ]
            (teasers
                |> sortBy .title
                |> map
                    (\teaser -> viewGuideTeaser includeSummary teaser)
            )

    else
        text ""
