module Page.Guide.View exposing (view)

import Css exposing (Style, batch, fontFamilies, listStyle, none, paddingLeft, zero)
import Html.Styled exposing (Html, a, div, h1, h2, li, text, ul)
import Html.Styled.Attributes exposing (css, href)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Message exposing (Msg)
import Page.Guide.Data
import Page.GuideTeaser
import Page.Shared.View
import Theme.FluidScale exposing (fontSize1)
import Theme.Global exposing (centerContent, contentWrapper, pageColumnBlockStyle, pageColumnStyle, topTwoColumnsWrapperStyle)
import Theme.Markdown exposing (markdownToHtml)


view : Language -> Page.Guide.Data.Guide -> List Page.Guide.Data.GuideListItem -> Html Msg
view language guide allGudes =
    div [ css [ centerContent ] ]
        [ h1 [ css [ guideTitleStyle ] ] [ text guide.title ]
        , div [ css [ contentWrapper ] ]
            [ div [ css [ topTwoColumnsWrapperStyle ] ]
                [ div [ css [ pageColumnStyle ] ]
                    [ div [ css [ guideSummaryStyle ] ] [ text guide.summary ]
                    , div [ css [ pageColumnBlockStyle ] ] (markdownToHtml guide.fullTextMarkdown)
                    ]
                , div [ css [ pageColumnStyle ] ]
                    [ viewMaybeVideo guide.maybeVideo
                    , viewMaybeAudio guide.maybeAudio
                    , viewRelatedGuideTeasers language guide.relatedGuideList allGudes
                    ]
                ]
            , div [ css [ pageColumnStyle ] ]
                [ viewRelatedStoryTeasers guide.relatedStoryList
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


viewRelatedGuideTeasers :
    Language
    -> List String
    -> List { title : String, slug : String }
    -> Html Msg
viewRelatedGuideTeasers language guideTitleList allGuidesSlugTitleList =
    let
        t : Key -> String
        t =
            translate language

        relatedGuideItems : List Page.Guide.Data.GuideListItem
        relatedGuideItems =
            allGuidesSlugTitleList
                |> List.filter (\{ title } -> List.member title guideTitleList)
    in
    if List.length relatedGuideItems > 0 then
        div []
            [ h2 [] [ text (t RelatedGuidesHeading) ]
            , ul [ css [ listStyleNone ] ]
                (List.map
                    (\{ title, slug } ->
                        li [] [ a [ href slug ] [ text title ] ]
                    )
                    relatedGuideItems
                )
            ]

    else
        text ""


viewRelatedStoryTeasers : List String -> Html Msg
viewRelatedStoryTeasers storyTitleList =
    if List.length storyTitleList > 0 then
        ul []
            (List.map
                (\title ->
                    li [] [ a [ href "" ] [ text title ] ]
                )
                storyTitleList
            )

    else
        text ""


guideTitleStyle : Style
guideTitleStyle =
    fontFamilies [ "Ludicrous", "serif" ]


guideSummaryStyle : Style
guideSummaryStyle =
    fontSize1


listStyleNone : Style
listStyleNone =
    batch
        [ listStyle none
        , paddingLeft zero
        ]
