port module Page.Guide.View exposing (print, view)

import Css exposing (Style, auto, backgroundColor, backgroundImage, backgroundPosition, backgroundRepeat, backgroundSize, batch, border, borderBottom3, center, color, column, contain, display, displayFlex, em, ex, flexDirection, flexWrap, fontFamilies, height, inlineBlock, justifyContent, listStyle, margin2, marginBottom, marginLeft, marginRight, marginTop, maxWidth, noRepeat, none, padding, paddingLeft, paddingRight, property, pseudoElement, px, rem, solid, url, width, wrap, zero)
import Html.Styled exposing (Html, a, button, div, h2, img, li, p, span, text, ul)
import Html.Styled.Attributes exposing (alt, attribute, css, href, src)
import Html.Styled.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import List
import Message exposing (Msg(..))
import Page.Guide.Data
import Page.Shared.Data
import Page.Shared.View
import Page.Story.Data
import Route exposing (Route(..))
import Theme.Global exposing (centerContent, contentWrapper, featureImageStyle, hideFromPrint, lightTeal, pageColumnBlockStyle, pageColumnStyle, primaryHeader, purple, screenReaderOnly, teal, teaserImageStyle, topTwoColumnsWrapperStyle, withMediaPrint)
import Theme.Markdown exposing (markdownToHtml)


view : Language -> Page.Guide.Data.Guide -> List Page.Guide.Data.GuideListItem -> List Page.Story.Data.StoryTeaser -> Html Msg
view language guide allGuides allStories =
    div []
        [ div [ css [ outerBorderStyle, withMediaPrint (Just [ marginBottom (rem 0) ]) ] ]
            [ div
                [ css [ centerContent ] ]
                [ primaryHeader [ css [ guideTitleStyle ] ] guide.title
                ]
            ]
        , div
            [ css [ centerContent ] ]
            [ viewRow
                ( viewImageColumn language guide
                , [ viewMaybeVideo language guide.maybeVideo
                  , viewMaybeAudio language guide.maybeAudio
                  , viewPrintGuide language
                  , viewRelatedGuideTeasers language guide.relatedGuideList allGuides
                  ]
                , [ viewRelatedStoryTeasers language guide.relatedStoryList allStories ]
                )
            ]
        ]



-- viewCategorySubHeader : Language -> Page.Guide.Data.Guide -> List (Html Msg)


viewImageColumn : Language -> Page.Guide.Data.Guide -> List (Html Msg)
viewImageColumn language guide =
    let
        t : Key -> String
        t =
            translate language

        image : Page.Guide.Data.Image
        image =
            case guide.maybeImage of
                Just anImage ->
                    anImage

                Nothing ->
                    Page.Guide.Data.defaultGuideImage

        categorySlugToKey : String -> Key
        categorySlugToKey slug =
            case slug of
                "admin-and-info" ->
                    CategoryAdminAndInfoName

                "media-publicity-events" ->
                    CategoryPublicityEventsName

                "working-with-people" ->
                    CategoryWorkingWithPeopleName

                "working-with-the-authorities" ->
                    CategoryWorkingWithAuthoritiesName

                _ ->
                    CategoryAdminAndInfoName
    in
    [ div [ css [ hideFromPrint ] ]
        [ img [ css [ featureImageStyle ], src image.src, alt image.alt ] []
        , case image.maybeCredit of
            Just aCredit ->
                p [ css [ imageCaptionStyle ] ] [ text aCredit ]

            Nothing ->
                text ""
        ]
    , div [ css [ hideFromPrint ] ] [ text (t InCategory ++ t (categorySlugToKey guide.categorySlug)) ]
    , div [] ([ h2 [] [ viewHeaderIcon (t GuideTextHeaderIconLink), text (t GuideTextHeader) ] ] ++ markdownToHtml guide.fullTextMarkdown)
    ]


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


viewMaybeVideo : Language -> Maybe Page.Shared.Data.VideoMeta -> Html Msg
viewMaybeVideo language maybeVideoMeta =
    let
        t : Key -> String
        t =
            translate language
    in
    case maybeVideoMeta of
        Just aVideo ->
            div []
                [ h2 [] [ viewHeaderIcon (t GuideVideoHeaderIconLink), text (t GuideVideoHeader) ]
                , Page.Shared.View.viewVideo aVideo
                ]

        Nothing ->
            text ""


viewMaybeAudio : Language -> Maybe Page.Shared.Data.AudioMeta -> Html Msg
viewMaybeAudio language maybeAudioMeta =
    let
        t : Key -> String
        t =
            translate language
    in
    case maybeAudioMeta of
        Just anAudio ->
            div [ css [ pageColumnStyle ] ]
                [ h2 [] [ viewHeaderIcon (t GuideAudioHeaderIconLink), text (t GuideAudioHeader) ]
                , Page.Shared.View.viewAudio anAudio
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
        div [ css [ hideFromPrint ] ]
            [ h2 [] [ text (t RelatedGuidesHeading) ]
            , ul [ css [ listStyleNone ] ]
                (List.map
                    (\item ->
                        li [] [ a [ href (Route.toString (Guide item.slug)) ] [ text (titleFromLanguage language item) ] ]
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
        div [ css [ hideFromPrint ] ]
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
        [ alt image.alt, src image.src, css [ teaserImageStyle ] ]
        []


viewPrintGuide : Language -> Html Msg
viewPrintGuide language =
    let
        t : Key -> String
        t =
            translate language
    in
    div [ css [ hideFromPrint ] ]
        [ h2 []
            [ viewHeaderIcon (t GuidePrintHeaderIconLink), text (t GuidePrintHeader) ]
        , p
            []
            [ button [ onClick Print, css [ printButtonStyle ] ] [ text (t GuideButtonText) ]
            , text (t GuideParagraphText)
            ]
        ]


viewHeaderIcon : String -> Html Msg
viewHeaderIcon url =
    span [ attribute "aria-hidden" "true" ]
        [ img [ src url, css [ headerIconStyle ] ] []
        ]


headerIconStyle : Style
headerIconStyle =
    batch [ display inlineBlock, marginRight (rem 0.5), maxWidth (em 1) ]


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


listStyleNone : Style
listStyleNone =
    batch
        [ listStyle none
        , paddingLeft zero
        ]


outerBorderStyle : Style
outerBorderStyle =
    batch
        [ borderBottom3 (rem 0.5) solid teal
        , marginBottom (rem 2)
        ]


imageCaptionStyle : Style
imageCaptionStyle =
    batch
        [ color purple, margin2 (rem 1) (rem 0) ]


guideTitleStyle : Style
guideTitleStyle =
    batch [ margin2 (rem 0) auto ]


printButtonStyle : Style
printButtonStyle =
    batch
        [ backgroundColor lightTeal
        , border (rem 0)
        , fontFamilies [ "Rubik", "sans-serif" ]
        , padding (rem 0)
        , paddingRight (rem 0.2)
        , pseudoElement "after"
            [ backgroundImage
                (url "/images/arrow.svg")
            , backgroundSize contain
            , backgroundPosition center
            , backgroundRepeat noRepeat
            , display inlineBlock
            , property "content" "' '"
            , height (ex 1.5)
            , width (em 1.0)
            , marginLeft (em 0.3)
            ]
        ]


port print : () -> Cmd msg
