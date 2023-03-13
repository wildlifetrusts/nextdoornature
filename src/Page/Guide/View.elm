module Page.Guide.View exposing (view)

import Html.Styled exposing (Html, a, div, h1, li, p, text, ul)
import Html.Styled.Attributes exposing (href)
import Page.Guide.Data
import Page.Shared
import Shared exposing (Model, Msg)


view : Page.Guide.Data.Guide -> Html Msg
view guide =
    div []
        [ h1 [] [ text guide.title ]
        , p [] [ text guide.fullTextMarkdown ]
        , viewMaybeVideo guide.maybeVideo
        , viewMaybeAudio guide.maybeAudio
        , viewRelatedStoryTeasers guide.relatedStoryList
        , viewRelatedGuideTeasers guide.relateGuideList
        ]


viewMaybeVideo : Maybe Page.Shared.VideoMeta -> Html Msg
viewMaybeVideo maybeVideoMeta =
    case maybeVideoMeta of
        Just aVideo ->
            Page.Shared.viewVideo aVideo

        Nothing ->
            text ""


viewMaybeAudio : Maybe Page.Shared.AudioMeta -> Html Msg
viewMaybeAudio maybeAudioMeta =
    case maybeAudioMeta of
        Just anAudio ->
            Page.Shared.viewAudio anAudio

        Nothing ->
            text ""


viewRelatedStoryTeasers : List Page.Shared.StoryTeaser -> Html Msg
viewRelatedStoryTeasers storyList =
    if List.length storyList > 0 then
        ul []
            (List.map
                (\{ title, url } ->
                    li [] [ a [ href url ] [ text title ] ]
                )
                storyList
            )

    else
        text ""


viewRelatedGuideTeasers : List Page.Shared.GuideTeaser -> Html Msg
viewRelatedGuideTeasers guideList =
    if List.length guideList > 0 then
        ul []
            (List.map
                (\{ title, url } ->
                    li [] [ a [ href url ] [ text title ] ]
                )
                guideList
            )

    else
        text ""
