module Page.Story.View exposing (view)

import Html.Styled exposing (Html, div, h1, img, p, text)
import Html.Styled.Attributes exposing (alt, css, src)
import Message exposing (Msg)
import Page.Shared.View
import Page.Story.Data
import Theme.Global exposing (centerContent, contentWrapper, featureImageStyle, pageColumnStyle, roundedCornerStyle, topTwoColumnsWrapperStyle)
import Theme.Markdown exposing (markdownToHtml)


view : Page.Story.Data.Story -> Html Msg
view story =
    div [ css [ centerContent ] ]
        [ h1 [] [ text story.title ]
        , div [ css [ contentWrapper ] ]
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
                    , div [] (viewImages story.images)
                    ]
                , div [ css [ pageColumnStyle ] ]
                    (markdownToHtml story.fullTextMarkdown)
                ]
            , viewColumnWrapper (Page.Shared.View.viewGuideTeaserList False story.relatedGuideList)
            ]
        ]


viewImages : List Page.Story.Data.Image -> List (Html Msg)
viewImages imageList =
    List.map
        (\image -> img [ src image.src, alt image.alt, css [ roundedCornerStyle, featureImageStyle ] ] [])
        (if List.length imageList == 0 then
            imageList ++ [ { alt = "", src = Page.Story.Data.defaultStoryImageSrc } ]

         else
            imageList
        )


viewColumnWrapper : Html Msg -> Html Msg
viewColumnWrapper content =
    if content /= text "" then
        div [ css [ pageColumnStyle ] ]
            [ content ]

    else
        text ""
