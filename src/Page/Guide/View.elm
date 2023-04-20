module Page.Guide.View exposing (view)

import Html.Styled exposing (Html, a, div, h1, li, p, text, ul)
import Html.Styled.Attributes exposing (css, href)
import Message exposing (Msg)
import Page.Guide.Data
import Page.GuideTeaser
import Page.Shared.View
import Theme.Global exposing (centerContent)
import Theme.Markdown exposing (markdownToHtml)


view : Page.Guide.Data.Guide -> Html Msg
view guide =
    div [ css [ centerContent ] ]
        [ h1 [] [ text guide.title ]
        , div [] (markdownToHtml guide.fullTextMarkdown)
        , viewMaybeVideo guide.maybeVideo
        , viewMaybeAudio guide.maybeAudio
        , Page.Shared.View.viewStoryTeasers guide.relatedStoryList
        , viewRelatedGuideTeasers guide.relatedGuideList
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


viewRelatedGuideTeasers : List Page.GuideTeaser.GuideTeaser -> Html Msg
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
