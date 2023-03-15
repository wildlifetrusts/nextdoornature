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
                    , p [] [ text story.description ]
                    ]

            Nothing ->
                p [] [ text story.description ]
        , Page.Shared.View.viewGuideTeaserList story.relatedGuideList
        ]
