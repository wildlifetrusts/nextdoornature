module Page.Shared exposing (AudioMeta, GuideTeaser, StoryTeaser, VideoMeta, guideTeaserList, viewAudio, viewGuideTeaserList, viewVideo)

import Html.Styled exposing (Html, a, div, iframe, img, li, p, text, ul)
import Html.Styled.Attributes exposing (alt, attribute, autoplay, href, src, title)
import List exposing (map, sortBy)
import Shared exposing (Msg)


type alias AudioMeta =
    { title : String
    , src : String
    }


type alias VideoMeta =
    { title : String
    , src : String
    }


type alias StoryTeaser =
    { title : String
    , url : String
    }


type alias GuideTeaser =
    { title : String
    , url : String
    , summary : String
    , img : { src : String, alt : String }
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


viewGuideTeaser : GuideTeaser -> Html Msg
viewGuideTeaser teaser =
    div []
        [ img [ src teaser.img.src, alt teaser.img.alt ] []
        , p []
            [ a [ href teaser.url ]
                [ text teaser.title ]
            ]
        , p
            []
            [ text teaser.summary ]
        ]


viewGuideTeaserList : List GuideTeaser -> Html Msg
viewGuideTeaserList teasers =
    if List.length teasers > 0 then
        ul []
            (teasers
                |> sortBy .title
                |> map
                    (\t -> li [] [ viewGuideTeaser t ])
            )

    else
        text ""



-- utils
-- [fFf] replace with live content


placeHolderImg : { src : String, alt : String }
placeHolderImg =
    { src = "/images/wildlife-trust-logo.png", alt = "[cCc]" }


guideTeaserList : List { title : String, summary : String } -> List GuideTeaser
guideTeaserList teaserStrings =
    List.map (\teaser -> GuideTeaser teaser.title ("/guides/" ++ String.replace " " "-" teaser.title) teaser.summary placeHolderImg) teaserStrings
