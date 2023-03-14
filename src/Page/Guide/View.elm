module Page.Guide.View exposing (view)

import Html.Styled exposing (Html, a, div, h1, li, p, text, ul)
import Html.Styled.Attributes exposing (href)
import Message exposing (Msg)
import Page.Guide.Data
import Page.Shared.View


view : Page.Guide.Data.Guide -> Html Msg
view guide =
    div []
        [ h1 [] [ text guide.title ]
        , p [] [ text guide.fullTextMarkdown ]
        , viewMaybeVideo guide.maybeVideo
        , viewMaybeAudio guide.maybeAudio
        , Page.Shared.View.viewStoryTeasers guide.relatedStoryList
        , viewRelatedGuideTeasers guide.relateGuideList
        ]


viewMaybeVideo : Maybe Page.Shared.View.VideoMeta -> Html Msg
viewMaybeVideo maybeVideoMeta =
    case maybeVideoMeta of
        Just aVideo ->
            Page.Shared.View.viewVideo aVideo

        Nothing ->
            text ""


viewMaybeAudio : Maybe Page.Shared.View.AudioMeta -> Html Msg
viewMaybeAudio maybeAudioMeta =
    case maybeAudioMeta of
        Just anAudio ->
            Page.Shared.View.viewAudio anAudio

        Nothing ->
            text ""


viewRelatedGuideTeasers : List Page.Shared.View.GuideTeaser -> Html Msg
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
