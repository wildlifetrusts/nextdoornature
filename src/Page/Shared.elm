module Page.Shared exposing (AudioMeta, GuideTeaser, StoryTeaser, VideoMeta, guideTeaserList, viewAudio, viewGuideTeaserList, viewStoryTeasers, viewVideo)

import Css exposing (Style, batch, center, column, displayFlex, flexDirection, flexWrap, height, justifyContent, maxWidth, px, wrap)
import Html.Styled exposing (Html, a, div, iframe, img, li, p, text, ul)
import Html.Styled.Attributes exposing (alt, attribute, autoplay, css, href, src, title)
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
    , slug : String
    , image : { src : String, alt : String }
    , description : String
    }


type alias GuideTeaser =
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
                    (\t -> li [] [ viewGuideTeaser t ])
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


guideTeaserList : List String -> List GuideTeaser
guideTeaserList titles =
    List.map (\title -> GuideTeaser title <| "/guides/" ++ String.replace " " "-" title) titles
