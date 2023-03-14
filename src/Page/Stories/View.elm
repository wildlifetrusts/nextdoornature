module Page.Stories.View exposing (view)

import Html.Styled exposing (Html, a, div, h1, img, li, p, text, ul)
import Html.Styled.Attributes exposing (alt, href, src)
import Message exposing (Msg)
import Page.Shared.View
import Page.Stories.Data


view : Page.Stories.Data.Story -> Html Msg
view story =
    div []
        [ h1 [] [ text story.title ]
        , case story.maybeMetadata of
            Just metadata ->
                div []
                    [ p [] [ text metadata.location ]
                    , p [] [ text metadata.author ]
                    , div []
                        (List.map (\image -> img [ src image.src, alt image.alt ] []) metadata.images)
                    , p [] [ text story.fullTextMarkdown ]
                    ]

            Nothing ->
                p [] [ text story.fullTextMarkdown ]
        , viewRelatedGuideTeasers story.relatedGuideList
        ]


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
