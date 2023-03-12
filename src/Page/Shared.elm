module Page.Shared exposing (AudioMeta, CaseStudyTeaser, ResourceTeaser, VideoMeta, viewAudio, viewVideo)

import Html.Styled exposing (Html, div, iframe, text)
import Html.Styled.Attributes exposing (attribute, autoplay, src, title)
import Shared exposing (Msg)


type alias AudioMeta =
    { title : String
    , src : String
    }


type alias VideoMeta =
    { title : String
    , src : String
    }


type alias CaseStudyTeaser =
    { title : String
    , url : String
    }


type alias ResourceTeaser =
    { title : String
    , url : String
    }


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
