module Page.Guide.View exposing (view)

import Css exposing (Style, batch, fontFamilies)
import Html.Styled exposing (Html, a, div, h1, li, text, ul)
import Html.Styled.Attributes exposing (css, href)
import Message exposing (Msg)
import Page.Guide.Data
import Page.GuideTeaser
import Page.Shared.View
import Theme.FluidScale exposing (fontSize1)
import Theme.Global exposing (centerContent, contentWrapper, pageColumnBlockStyle, pageColumnStyle, topTwoColumnsWrapperStyle)
import Theme.Markdown exposing (markdownToHtml)


view : Page.Guide.Data.Guide -> Html Msg
view guide =
    div [ css [ centerContent ] ]
        [ h1 [ css [ guideTitleStyle ] ] [ text guide.title ]
        , div [ css [ contentWrapper ] ]
            [ div [ css [ topTwoColumnsWrapperStyle ] ]
                [ div [ css [ pageColumnStyle ] ]
                    [ div [ css [ guideSummaryStyle ] ] [ text guide.summary ]
                    , div [ css [ pageColumnBlockStyle ] ] (markdownToHtml guide.fullTextMarkdown)
                    ]
                , viewMaybeVideo guide.maybeVideo
                , viewMaybeAudio guide.maybeAudio
                ]
            , div [ css [ pageColumnStyle ] ]
                [ Page.Shared.View.viewStoryTeasers guide.relatedStoryList
                , viewRelatedGuideTeasers guide.relatedGuideList
                ]
            ]
        ]


viewMaybeVideo : Maybe Page.Shared.View.VideoMeta -> Html Msg
viewMaybeVideo maybeVideoMeta =
    case maybeVideoMeta of
        Just aVideo ->
            div [ css [ pageColumnStyle ] ]
                [ Page.Shared.View.viewVideo aVideo
                ]

        Nothing ->
            text ""


viewMaybeAudio : Maybe Page.Shared.View.AudioMeta -> Html Msg
viewMaybeAudio maybeAudioMeta =
    case maybeAudioMeta of
        Just anAudio ->
            div [ css [ pageColumnStyle ] ]
                [ Page.Shared.View.viewAudio anAudio
                ]

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


guideTitleStyle : Style
guideTitleStyle =
    fontFamilies [ "Ludicrous", "serif" ]


guideSummaryStyle : Style
guideSummaryStyle =
    fontSize1
