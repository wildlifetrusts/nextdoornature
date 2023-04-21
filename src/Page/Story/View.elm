module Page.Story.View exposing (view)

import Html.Styled exposing (Html, a, div, h1, img, li, p, text, ul)
import Html.Styled.Attributes exposing (alt, css, href, src)
import Message exposing (Msg)
import Page.Shared.View
import Page.Story.Data
import Theme.Global exposing (centerContent, roundedCorners)
import Theme.Markdown exposing (markdownToHtml)


view : Page.Story.Data.Story -> Html Msg
view story =
    div [ css [ centerContent ] ]
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
                    List.map (\image -> img [ css roundedCorners, src image.src, alt image.alt ] []) images

                Nothing ->
                    [ text "" ]
            )
        , div [] (markdownToHtml story.fullTextMarkdown)
        , Page.Shared.View.viewGuideTeaserList story.relatedGuideList
        ]
