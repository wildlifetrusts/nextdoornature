module Page.Story.View exposing (view)

import Html.Styled exposing (Html, div, h1, img, p, text)
import Html.Styled.Attributes exposing (alt, css, src)
import Message exposing (Msg)
import Page.Shared.View
import Page.Story.Data
import Theme.Global exposing (centerContent, featureImageStyle, mainContainerStyles, pageColumnStyle, topTwoColumnsWrapperStyle)
import Theme.Markdown exposing (markdownToHtml)


view : Page.Story.Data.Story -> Html Msg
view story =
    div [ css [ centerContent ] ]
        [ h1 [] [ text story.title ]
        , div [ css [ mainContainerStyles ] ]
            [ div [ css [ topTwoColumnsWrapperStyle ] ]
                [ div [ css [ pageColumnStyle ] ]
                    [ div []
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
                                List.map (\image -> img [ src image.src, alt image.alt, css [ featureImageStyle ] ] []) images

                            Nothing ->
                                [ text "" ]
                        )
                    ]
                , div [ css [ pageColumnStyle ] ]
                    (markdownToHtml story.fullTextMarkdown)
                ]
            , viewColumnWrapper (Page.Shared.View.viewGuideTeaserList story.relatedGuideList)
            ]
        ]


viewColumnWrapper : Html Msg -> Html Msg
viewColumnWrapper content =
    if content /= text "" then
        div [ css [ pageColumnStyle ] ]
            [ content ]

    else
        text ""
