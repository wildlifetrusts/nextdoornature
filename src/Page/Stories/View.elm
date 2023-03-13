module Page.Stories.View exposing (view)

import Html.Styled exposing (Html, a, div, h1, li, p, text, ul)
import Html.Styled.Attributes exposing (href)
import Page.Shared
import Page.Stories.Data
import Shared exposing (Msg)


view : Page.Stories.Data.Story -> Html Msg
view story =
    div []
        [ h1 [] [ text story.title ]
        , p [] [ text story.fullTextMarkdown ]
        , viewRelatedStoryTeasers story.relatedStoryList
        , viewRelatedResourceTeasers story.relatedResourceList
        ]


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


viewRelatedResourceTeasers : List Page.Shared.ResourceTeaser -> Html Msg
viewRelatedResourceTeasers resourceList =
    if List.length resourceList > 0 then
        ul []
            (List.map
                (\{ title, url } ->
                    li [] [ a [ href url ] [ text title ] ]
                )
                resourceList
            )

    else
        text ""
