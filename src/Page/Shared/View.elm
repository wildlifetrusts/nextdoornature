module Page.Shared.View exposing (AudioMeta, GuideTeaser, Image, StoryTeaser, VideoMeta, audioDecoder, guideTeaserDecoder, imageDecoder, storyTeaserDecoder, videoDecoder, viewAudio, viewGuideTeaserList, viewStoryTeasers, viewVideo)

import Css exposing (Style, batch, center, column, displayFlex, flexDirection, flexWrap, height, justifyContent, maxWidth, px, wrap)
import Html.Styled exposing (Html, a, div, iframe, img, li, p, text, ul)
import Html.Styled.Attributes exposing (alt, attribute, autoplay, css, href, src, title)
import Json.Decode exposing (Decoder)
import List exposing (map, sortBy)
import Message exposing (Msg)
import String exposing (length, padRight)


type alias AudioMeta =
    { title : String
    , src : String
    }


type alias Image =
    { src : String, alt : String }


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


type alias StoryTeaser =
    { title : String
    , slug : String
    , image : Image
    , description : String
    }


storyTeaserDecoder : Json.Decode.Decoder StoryTeaser
storyTeaserDecoder =
    Json.Decode.map4 StoryTeaser
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "slug" Json.Decode.string)
        (Json.Decode.field "image" imageDecoder)
        (Json.Decode.field "description" Json.Decode.string)


imageDecoder : Decoder Image
imageDecoder =
    Json.Decode.map2 Image
        (Json.Decode.field "src" Json.Decode.string)
        (Json.Decode.field "alt" Json.Decode.string)


type alias GuideTeaser =
    { title : String
    , url : String
    , summary : String
    }


guideTeaserDecoder : Json.Decode.Decoder GuideTeaser
guideTeaserDecoder =
    Json.Decode.map3 GuideTeaser
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "url" Json.Decode.string)
        (Json.Decode.field "summary" Json.Decode.string)


viewVideo : VideoMeta -> Html Msg
viewVideo videoMeta =
    div []
        [ iframe
            [ src videoMeta.src
            , attribute "frameborder" "0"
            , attribute "allowfullscreen" "true"
            , autoplay False
            , title videoMeta.title
            ]
            []
        ]


viewAudio : AudioMeta -> Html Msg
viewAudio audioMeta =
    text "[fFf] render audio player"


limitContent : String -> Int -> String
limitContent summary limit =
    if length summary > limit then
        summary
            |> String.slice 0 (limit - 3)
            |> padRight limit '.'

    else
        summary


viewGuideTeaser : GuideTeaser -> Html Msg
viewGuideTeaser teaser =
    div []
        [ p []
            [ a [ href teaser.url ] [ text teaser.title ] ]
        , p
            []
            [ text <| limitContent teaser.summary 240 ]
        ]


viewGuideTeaserList : List GuideTeaser -> Html Msg
viewGuideTeaserList teasers =
    if List.length teasers > 0 then
        ul []
            (teasers
                |> sortBy .title
                |> map
                    (\teaser -> li [] [ viewGuideTeaser teaser ])
            )

    else
        text ""


viewStoryTeasers : List StoryTeaser -> Html Msg
viewStoryTeasers teasers =
    if List.length teasers > 0 then
        div [ css [ viewStoryTeasersStyle ] ]
            (teasers
                |> sortBy .title
                |> map
                    (\{ description, image, slug, title } ->
                        div [ css [ storyTeaserStyle ] ]
                            [ img [ src image.src, alt image.alt ] []
                            , a [ href ("/stories/" ++ slug) ] [ text title ]
                            , p [] [ text description ]
                            ]
                    )
            )

    else
        text ""


viewStoryTeasersStyle : Style
viewStoryTeasersStyle =
    batch
        [ justifyContent center
        , displayFlex
        , flexWrap wrap
        , maxWidth (px 400)
        ]


storyTeaserStyle : Style
storyTeaserStyle =
    batch
        [ justifyContent center
        , displayFlex
        , flexDirection column
        , height (px 150)
        , maxWidth (px 150)
        ]



-- utils
-- guideTeaserList : List String -> List GuideTeaser
-- guideTeaserList titles =
--     List.map (\title -> GuideTeaser title <| "/guides/" ++ String.replace " " "-" title) titles
