module Page.Story.View exposing (view)

import Css exposing (Style, batch, margin3, rem)
import Html.Styled exposing (Html, div, h1, img, p, text)
import Html.Styled.Attributes exposing (alt, css, src)
import Message exposing (Msg)
import Page.Guides.View
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
            , viewColumnWrapper (Page.Guides.View.viewTeaserList False story.relatedGuideList)
            ]
        ]


viewImages : List Page.Story.Data.Image -> List (Html Msg)
viewImages imageList =
    List.map
        (\image ->
            div []
                [ img [ src image.src, alt image.alt, css [ roundedCornerStyle, featureImageStyle ] ] []
                , viewImageCaption (maybeCaptions image.maybeCaption image.maybeCredit)
                ]
        )
        (if List.length imageList == 0 then
            imageList
                ++ [ { alt = ""
                     , src = Page.Story.Data.defaultStoryImageSrc
                     , maybeCaption = Nothing
                     , maybeCredit = Nothing
                     }
                   ]

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


maybeCaptions : Maybe String -> Maybe String -> Maybe String
maybeCaptions maybeImageCaption maybeImageCredit =
    case maybeImageCredit of
        Just anImageCredit ->
            case maybeImageCaption of
                Just anImageCaption ->
                    let
                        concatenator =
                            if
                                String.endsWith "." anImageCaption
                                    || String.endsWith "!" anImageCaption
                                    || String.endsWith "?" anImageCaption
                            then
                                ""

                            else
                                "."
                    in
                    Just (String.concat [ anImageCaption, concatenator, " Image credit: ", anImageCredit ])

                Nothing ->
                    Just (String.concat [ "Image credit: ", anImageCredit ])

        Nothing ->
            maybeImageCaption


viewImageCaption : Maybe String -> Html Msg
viewImageCaption maybeCaption =
    case maybeCaption of
        Just aCaption ->
            div [ css [ imageCaptionStyle ] ]
                [ text aCaption ]

        Nothing ->
            text ""


imageCaptionStyle : Style
imageCaptionStyle =
    batch
        [ margin3 (rem 0) (rem 0) (rem 1) ]
