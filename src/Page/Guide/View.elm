module Page.Guide.View exposing (view)

import Css exposing (Style, batch, center, column, displayFlex, flexDirection, flexWrap, fontFamilies, justifyContent, listStyle, marginTop, maxWidth, none, padding2, paddingLeft, px, wrap, zero)
import Html.Styled exposing (Html, a, div, h1, h2, img, li, text, ul)
import Html.Styled.Attributes exposing (alt, css, href, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import List
import Message exposing (Msg)
import Page.Guide.Data
import Page.Shared.Data
import Page.Shared.View
import Page.Story.Data
import Route exposing (Route(..))
import Theme.FluidScale exposing (fontSize4)
import Theme.Global exposing (centerContent, contentWrapper, featureImageStyle, pageColumnBlockStyle, pageColumnStyle, roundedCornerStyle, teaserImageStyle, topTwoColumnsWrapperStyle)
import Theme.Markdown exposing (markdownToHtml)


view : Language -> Page.Guide.Data.Guide -> List Page.Guide.Data.GuideListItem -> List Page.Story.Data.StoryTeaser -> Html Msg
view language guide allGuides allStories =
    div [ css [ centerContent ] ]
        [ h1 [ css [ guideTitleStyle ] ] [ text guide.title ]
        , viewSummaryImageRow guide
        , viewRow
            ( markdownToHtml guide.fullTextMarkdown
            , [ viewMaybeVideo guide.maybeVideo
              , viewMaybeAudio guide.maybeAudio
              , viewRelatedGuideTeasers language guide.relatedGuideList allGuides
              ]
            , [ viewRelatedStoryTeasers language guide.relatedStoryList allStories ]
            )
        ]


viewSummaryImageRow : Page.Guide.Data.Guide -> Html Msg
viewSummaryImageRow guide =
    let
        image : Page.Guide.Data.Image
        image =
            case guide.maybeImage of
                Just anImage ->
                    anImage

                Nothing ->
                    Page.Guide.Data.defaultGuideImage
    in
    viewRow
        ( [ div [ css [ guideSummaryStyle ] ] [ text guide.summary ] ]
        , [ img [ css [ featureImageStyle ], src image.src, alt image.alt ] [] ]
        , case image.maybeCredit of
            Just aCredit ->
                [ text aCredit ]

            Nothing ->
                [ text "" ]
        )


viewRow : ( List (Html Msg), List (Html Msg), List (Html Msg) ) -> Html Msg
viewRow ( content1, content2, content3 ) =
    div [ css [ contentWrapper ] ]
        [ div [ css [ topTwoColumnsWrapperStyle ] ]
            [ div [ css [ pageColumnStyle ] ]
                [ div [ css [ pageColumnBlockStyle ] ] content1 ]
            , div [ css [ pageColumnStyle ] ] content2
            ]
        , div [ css [ pageColumnStyle ] ] content3
        ]


viewMaybeVideo : Maybe Page.Shared.Data.VideoMeta -> Html Msg
viewMaybeVideo maybeVideoMeta =
    case maybeVideoMeta of
        Just aVideo ->
            Page.Shared.View.viewVideo aVideo

        Nothing ->
            text ""


viewMaybeAudio : Maybe Page.Shared.Data.AudioMeta -> Html Msg
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
    -> List Page.Guide.Data.GuideListItem
    -> Html Msg
viewRelatedGuideTeasers language guideTitleList allGuidesSlugTitleList =
    let
        relatedGuideItems : List Page.Guide.Data.GuideListItem
        relatedGuideItems =
            allGuidesSlugTitleList
                |> List.filter (\{ titleKey } -> List.member titleKey guideTitleList)
    in
    if List.length relatedGuideItems > 0 then
        let
            t : Key -> String
            t =
                translate language
        in
        div []
            [ h2 [] [ text (t RelatedGuidesHeading) ]
            , ul [ css [ listStyleNone ] ]
                (List.map
                    (\item ->
                        li [] [ a [ href item.slug ] [ text (titleFromLanguage language item) ] ]
                    )
                    relatedGuideItems
                )
            ]

    else
        text ""


titleFromLanguage :
    Language
    ->
        { item
            | en : { a | title : String }
            , cy : { a | title : String }
        }
    -> String
titleFromLanguage language { en, cy } =
    case language of
        English ->
            en.title

        Welsh ->
            cy.title


teaserImageFromLanguage : Language -> Page.Story.Data.StoryTeaser -> Maybe Page.Story.Data.Image
teaserImageFromLanguage language { en, cy } =
    case language of
        English ->
            en.maybeImage

        Welsh ->
            cy.maybeImage


viewRelatedStoryTeasers :
    Language
    -> List String
    -> List Page.Story.Data.StoryTeaser
    -> Html Msg
viewRelatedStoryTeasers language storyTitleList allStoryTeasers =
    let
        relatedStoryItems : List Page.Story.Data.StoryTeaser
        relatedStoryItems =
            allStoryTeasers
                |> List.filter (\{ titleKey } -> List.member titleKey storyTitleList)
    in
    if List.length relatedStoryItems > 0 then
        let
            t : Key -> String
            t =
                translate language
        in
        div []
            [ h2 [ css [ marginTop zero ] ] [ text (t RelatedStoriesHeading) ]
            , div [ css [ viewStoryTeasersStyle ] ]
                (relatedStoryItems
                    |> List.sortBy .slug
                    |> List.map
                        (\teaser ->
                            div [ css [ storyteaserContainerStyle ] ]
                                [ viewStoryImage (teaserImageFromLanguage language teaser)
                                , a [ href (Route.toString (Story teaser.slug)) ] [ text (titleFromLanguage language teaser) ]
                                ]
                        )
                )
            ]

    else
        text ""


viewStoryImage : Maybe Page.Story.Data.Image -> Html Msg
viewStoryImage maybeImage =
    let
        image : Page.Story.Data.Image
        image =
            case maybeImage of
                Just anImage ->
                    { alt = anImage.alt
                    , src = anImage.src
                    , maybeCaption = anImage.maybeCaption
                    , maybeCredit = anImage.maybeCredit
                    }

                Nothing ->
                    { alt = ""
                    , src = Page.Story.Data.defaultStoryImageSrc
                    , maybeCaption = Nothing
                    , maybeCredit = Nothing
                    }
    in
    img
        [ alt image.alt
        , src image.src
        , css
            [ roundedCornerStyle
            , teaserImageStyle
            ]
        ]
        []


viewStoryTeasersStyle : Style
viewStoryTeasersStyle =
    batch
        [ justifyContent center
        , displayFlex
        , flexWrap wrap
        , maxWidth (px 400)
        ]


storyteaserContainerStyle : Style
storyteaserContainerStyle =
    batch
        [ justifyContent center
        , displayFlex
        , flexDirection column
        , maxWidth (px 150)
        ]


guideTitleStyle : Style
guideTitleStyle =
    fontFamilies [ "Ludicrous", "serif" ]


guideSummaryStyle : Style
guideSummaryStyle =
    fontSize4


listStyleNone : Style
listStyleNone =
    batch
        [ listStyle none
        , paddingLeft zero
        ]
