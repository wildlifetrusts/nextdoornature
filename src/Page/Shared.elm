module Page.Shared exposing (AudioMeta, CaseStudyTeaser, ResourceTeaser, VideoMeta, viewAudio, viewVideo)

import Html.Styled exposing (Html, div, iframe, text)
import Html.Styled.Attributes exposing (attribute, autoplay, src)
import Shared exposing (Msg)
import Url


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
    , url : Url.Url
    }


type alias ResourceTeaser =
    { title : String
    , url : Url.Url
    }


viewVideo : VideoMeta -> Html Msg
viewVideo videoMeta =
    div []
        [ iframe
            [ src videoMeta.src
            , attribute "frameborder" "0"
            , attribute "allowfullscreen" "true"
            , attribute "gyroscope" "true"
            , autoplay False
            , attribute "title" videoMeta.title
            ]
            []
        ]


viewAudio : AudioMeta -> Html Msg
viewAudio audioMeta =
    text "[fFf] render audio player"
