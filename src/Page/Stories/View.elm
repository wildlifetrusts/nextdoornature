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
        , div []
            [ case story.maybeGroupOrIndividual of
                Just groupOrIndividual ->
                    p [] [ text groupOrIndividual ]

                Nothing ->
                    text ""
            , case story.maybeLocation of
                Just location ->
                    p [] [ text location ]

                Nothing ->
                    text ""
            ]
        , div []
            (case story.maybeImages of
                Just images ->
                    List.map (\image -> img [ src image.src, alt image.alt ] []) images

                Nothing ->
                    [ text "" ]
            )
        , p [] [ text story.fullTextMarkdown ]
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
