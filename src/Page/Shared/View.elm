module Page.Shared.View exposing (AudioMeta, GuideTeaser, StoryTeaser, VideoMeta, audioDecoder, guideTeaserDecoder, storyTeaserDecoder, videoDecoder, viewAudio, viewGuideTeaserList, viewVideo)

import Html.Styled exposing (Html, a, div, iframe, li, text, ul)
import Html.Styled.Attributes exposing (attribute, autoplay, href, src, title)
import Json.Decode
import List exposing (map, sortBy)
import Message exposing (Msg)


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


type alias StoryTeaser =
    { title : String
    , url : String
    }


storyTeaserDecoder : Json.Decode.Decoder StoryTeaser
storyTeaserDecoder =
    Json.Decode.map2 StoryTeaser
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "url" Json.Decode.string)


type alias GuideTeaser =
    { title : String
    , url : String
    }


guideTeaserDecoder : Json.Decode.Decoder GuideTeaser
guideTeaserDecoder =
    Json.Decode.map2 GuideTeaser
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "url" Json.Decode.string)


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


viewGuideTeaser : GuideTeaser -> Html Msg
viewGuideTeaser teaser =
    a [ href teaser.url ] [ text teaser.title ]


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
