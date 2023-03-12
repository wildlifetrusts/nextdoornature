module Page.Resource.View exposing (view)

import Html.Styled exposing (Html, a, div, h1, li, p, text, ul)
import Html.Styled.Attributes exposing (href)
import Page.Resource.Data
import Page.Shared
import Shared exposing (Model, Msg)
import Url


view : Model -> Page.Resource.Data.Resource -> Html Msg
view model resource =
    div []
        [ h1 [] [ text resource.title ]
        , p [] [ text resource.fullTextMarkdown ]
        , viewMaybeVideo resource.maybeVideo
        , viewMaybeAudio resource.maybeAudio
        , viewRelatedCaseStudyTeasers resource.relatedCaseStudyList
        , viewRelatedResourceTeasers resource.relatedResourceList
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


viewRelatedCaseStudyTeasers : List Page.Shared.CaseStudyTeaser -> Html Msg
viewRelatedCaseStudyTeasers caseStudyList =
    if List.length caseStudyList > 0 then
        ul []
            (List.map
                (\{ title, url } ->
                    li [] [ a [ href (Url.toString url) ] [ text title ] ]
                )
                caseStudyList
            )

    else
        text ""


viewRelatedResourceTeasers : List Page.Shared.ResourceTeaser -> Html Msg
viewRelatedResourceTeasers resourceList =
    if List.length resourceList > 0 then
        ul []
            (List.map
                (\{ title, url } ->
                    li [] [ a [ href (Url.toString url) ] [ text title ] ]
                )
                resourceList
            )

    else
        text ""
