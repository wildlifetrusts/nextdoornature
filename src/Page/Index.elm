module Page.Index exposing (view)

import Css exposing (Style, batch, column, flex, flexDirection, fontWeight, int, margin, marginBottom, padding, pct, property, rem, row, width)
import Html.Styled exposing (Html, a, div, h2, h3, img, li, p, section, text, ul)
import Html.Styled.Attributes exposing (alt, css, href, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Message exposing (Msg)
import Page.Data
import Page.Guide.Data
import Page.Search.Data
import Page.Shared.Data
import Page.Shared.View
import Route
import Shared exposing (Model, shuffleList)
import Theme.FluidScale
import Theme.Global exposing (centerContent, contentWrapper, listStyleNone, pageColumnStyle, primaryHeader, topTwoColumnsWrapperStyle, withMediaMobileUp, withMediaTabletPortraitUp)
import Theme.Markdown exposing (markdownToHtml)


view : Model -> Page.Data.Page -> Html Msg
view model page =
    let
        t : Key -> String
        t =
            translate model.language
    in
    div [ css [ centerContent ] ]
        [ primaryHeader [] page.title
        , div [ css [ contentWrapper ] ]
            [ div [ css [ topTwoColumnsWrapperStyle ] ]
                [ div [ css [ pageColumnStyle ] ]
                    (markdownToHtml page.fullTextMarkdown
                        ++ (if String.length (t HomeYoutubeLink) == 0 then
                                []

                            else
                                [ div [ css [ marginBottom (rem 1), width (pct 100) ] ] [ Page.Shared.View.viewVideo { title = t HomeVideoTitle, src = t HomeYoutubeLink, description = "" } ] ]
                           )
                    )
                , div [ css [ pageColumnStyle ] ]
                    [ div [ css [ teaserColumnStyle ] ]
                        [ div [ css [ teaserBlockStyle ] ]
                            [ h2 [ css [ teaserSubtitleStyle ] ] [ text (t GuideHighlightsSubtitle) ]
                            , Page.Search.Data.teaserListFromGuideDict model.language model.content.guides
                                |> shuffleList model.seed
                                |> List.take 2
                                |> viewTeaserList
                            ]
                        , div [ css [ teaserBlockStyle ] ]
                            [ h2 [ css [ teaserSubtitleStyle ] ] [ text (t StoryHighlightsSubtitle) ]
                            , Page.Search.Data.teaserListFromStoryDict model.language model.content.stories
                                |> shuffleList model.seed
                                |> List.take 2
                                |> viewTeaserList
                            ]
                        ]
                    , Page.Shared.View.viewCallForStory model.language ""
                    ]
                ]
            , div [ css [ pageColumnStyle ] ]
                (h2 [] [ text (t ExploreGuidesListHeading) ]
                    :: viewGuidesByCategory model.language (Page.Guide.Data.allGuidesSlugTitleList model.content.guides)
                )
            ]
        ]


viewTeaserList : List Page.Shared.Data.Teaser -> Html Msg
viewTeaserList teasers =
    if List.length teasers > 0 then
        ul [ css [ teaserListLayoutStyle ] ]
            (teasers
                |> List.map
                    (\teaser -> viewGuideTeaser teaser)
            )

    else
        text ""


teaserBlockStyle : Style
teaserBlockStyle =
    batch
        [ flex (int 1)
        ]


viewGuideTeaser : Page.Shared.Data.Teaser -> Html Msg
viewGuideTeaser teaser =
    let
        image : Page.Shared.Data.TeaserImage
        image =
            case teaser.maybeImage of
                Just anImage ->
                    anImage

                Nothing ->
                    Page.Shared.Data.defaultTeaserImage
    in
    li [ css [ Theme.Global.teaserContainerStyle ] ]
        [ img
            [ alt image.alt
            , src image.src
            , css
                [ Theme.Global.teaserImageStyle
                ]
            ]
            []
        , p [ css [ Theme.Global.teaserRowStyle ] ]
            [ a [ css [ fontWeight (int 600) ], href teaser.url ] [ text teaser.title ] ]
        ]


viewGuidesByCategory : Language -> List Page.Guide.Data.GuideListItem -> List (Html msg)
viewGuidesByCategory language guideTitleList =
    List.map
        (\categoryKey -> viewGuideCategorySection language categoryKey (guideTitlesFromCategory categoryKey guideTitleList))
        [ CategoryAdminAndInfoName
        , CategoryPublicityEventsName
        , CategoryWorkingWithPeopleName
        , CategoryWorkingWithAuthoritiesName
        ]


guideTitlesFromCategory : Key -> List Page.Guide.Data.GuideListItem -> List Page.Guide.Data.GuideListItem
guideTitlesFromCategory categoryKey allGuides =
    List.filter (\guide -> guide.categoryKey == categoryKey) allGuides


viewGuideCategorySection : Language -> Key -> List Page.Guide.Data.GuideListItem -> Html msg
viewGuideCategorySection language categoryKey guidesInCategory =
    if List.length guidesInCategory > 0 then
        let
            t : Key -> String
            t =
                translate language
        in
        section []
            [ h3 [] [ text (t categoryKey) ]
            , viewGuideCategoryList language guidesInCategory
            ]

    else
        text ""


viewGuideCategoryList : Language -> List Page.Guide.Data.GuideListItem -> Html msg
viewGuideCategoryList language guides =
    ul [ css [ listStyleNone ] ]
        (List.map
            (\guide ->
                li [] [ a [ href (Route.toString (Route.Guide guide.slug)) ] [ text (Page.Guide.Data.titleFromLanguage language guide) ] ]
            )
            guides
        )


teaserSubtitleStyle : Style
teaserSubtitleStyle =
    batch
        [ marginBottom (rem 1)
        , Theme.FluidScale.fontSizeLarge
        ]


teaserColumnStyle : Style
teaserColumnStyle =
    batch
        [ pageColumnStyle
        , property "gap" "1rem"
        , withMediaTabletPortraitUp [ flexDirection column ]
        , withMediaMobileUp [ flexDirection row ]
        ]


teaserListLayoutStyle : Style
teaserListLayoutStyle =
    batch
        [ property "display" "grid"
        , margin (rem 0)
        , padding (rem 0)
        , property "grid-template-columns" "repeat(2, 1fr)"
        , property "gap" "1rem"
        , width (pct 100)
        ]
