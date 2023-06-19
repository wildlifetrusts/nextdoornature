module Page.Index exposing (view)

import Css exposing (Style, backgroundColor, backgroundImage, backgroundPosition, backgroundRepeat, batch, color, column, flexDirection, fontWeight, int, marginBottom, noRepeat, padding, paddingRight, pct, property, rem, right, row, url, width)
import Html.Styled exposing (Html, a, div, h2, h3, li, p, section, text, ul)
import Html.Styled.Attributes exposing (css, href)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Message exposing (Msg)
import Page.Data
import Page.Guide.Data
import Page.Search.Data
import Page.Search.View
import Route
import Shared exposing (Model, shuffleList)
import Theme.FluidScale
import Theme.Global exposing (centerContent, contentWrapper, listStyleNone, pageColumnStyle, primaryHeader, purple, topTwoColumnsWrapperStyle, white, withMediaMobileUp, withMediaTabletPortraitUp)
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
                    (markdownToHtml page.fullTextMarkdown)
                , div [ css [ teaserColumnStyle ] ]
                    [ div []
                        [ h2 [ css [ teaserSubtitleStyle ] ] [ text (t GuideHighlightsSubtitle) ]
                        , Page.Search.Data.teaserListFromGuideDict model.language model.content.guides
                            |> shuffleList model.seed
                            |> List.take 2
                            |> Page.Search.View.viewTeaserList False Page.Search.View.homePageLayoutStyle
                        ]
                    , div []
                        [ h2 [ css [ teaserSubtitleStyle ] ] [ text (t StoryHighlightsSubtitle) ]
                        , Page.Search.Data.teaserListFromStoryDict model.language model.content.stories
                            |> shuffleList model.seed
                            |> List.take 2
                            |> Page.Search.View.viewTeaserList False Page.Search.View.homePageLayoutStyle
                        ]
                    , viewCallForStory model.language
                    ]
                ]
            , div [ css [ pageColumnStyle ] ]
                (h2 [] [ text (t ExploreGuidesListHeading) ]
                    :: viewGuidesByCategory model.language (Page.Guide.Data.allGuidesSlugTitleList model.content.guides)
                )
            ]
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


viewCallForStory : Language -> Html Msg
viewCallForStory language =
    let
        t : Key -> String
        t =
            translate language
    in
    div [ css [ callForStoryStyle, Theme.Global.roundedCornerStyle ] ]
        [ h2 [ css [ callForStoryHeadingStyle ] ] [ text (t CallForStoryHeading) ]
        , p [] [ text (t CallForStoryP) ]
        , a [ href (Route.toString Route.SubmitStory), css [ callForStoryLinkStyle ] ] [ text (t CallForStoryLinkText) ]
        ]


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


callForStoryStyle : Style
callForStoryStyle =
    batch
        [ backgroundColor purple
        , color white
        , padding (rem 1)
        , width (pct 100)
        ]


callForStoryHeadingStyle : Style
callForStoryHeadingStyle =
    color white


callForStoryLinkStyle : Style
callForStoryLinkStyle =
    batch
        [ backgroundImage (url "/images/arrow--white.svg")
        , backgroundPosition right
        , backgroundRepeat noRepeat
        , color white
        , fontWeight (int 500)
        , paddingRight (rem 1.5)
        ]
