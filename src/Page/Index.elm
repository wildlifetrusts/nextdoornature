module Page.Index exposing (view)

import Css exposing (Style, backgroundColor, backgroundImage, backgroundPosition, backgroundRepeat, batch, color, column, flexDirection, fontWeight, int, marginBottom, noRepeat, padding, paddingRight, pct, property, rem, right, row, url, width)
import Html.Styled exposing (Html, a, div, h2, h3, li, p, section, text, ul)
import Html.Styled.Attributes exposing (css, href)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Message exposing (Msg)
import Page.Guide.Data
import Page.Guides.Data
import Page.Guides.View
import Route
import Shared exposing (Model, shuffleList)
import Theme.FluidScale
import Theme.Global exposing (centerContent, contentWrapper, listStyleNone, pageColumnBlockStyle, pageColumnStyle, primaryHeader, purple, topTwoColumnsWrapperStyle, white, withMediaMobileUp, withMediaTabletPortraitUp)


view : Model -> Html Msg
view model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    div [ css [ centerContent ] ]
        [ primaryHeader [] (t HomeTitle)
        , div [ css [ contentWrapper ] ]
            [ div [ css [ topTwoColumnsWrapperStyle ] ]
                [ div [ css [ pageColumnStyle ] ]
                    (viewTextColumn t [ WelcomeP1, WelcomeP2, WelcomeP3 ])
                , div [ css [ teaserColumnStyle ] ]
                    [ div []
                        [ h2 [ css [ teaserSubtitleStyle ] ] [ text (t GuideHighlightsSubtitle) ]
                        , Page.Guides.Data.teaserListFromGuideDict model.language model.content.guides
                            |> shuffleList model.seed
                            |> List.take 2
                            |> Page.Guides.View.viewTeaserList False Page.Guides.View.homePageLayoutStyle
                        ]
                    , div []
                        [ h2 [ css [ teaserSubtitleStyle ] ] [ text (t StoryHighlightsSubtitle) ]
                        , Page.Guides.Data.teaserListFromStoryDict model.language model.content.stories
                            |> shuffleList model.seed
                            |> List.take 2
                            |> Page.Guides.View.viewTeaserList False Page.Guides.View.homePageLayoutStyle
                        ]
                    ]
                ]
            , div [ css [ pageColumnStyle ] ]
                (h2 [] [ text (t ExploreGuidesListHeading) ]
                    :: (viewGuidesByCategory model.language (Page.Guide.Data.allGuidesSlugTitleList model.content.guides)
                            ++ [ viewCallForStory model.language ]
                       )
                )
            ]
        ]


viewTextColumn : (Key -> String) -> List Key -> List (Html msg)
viewTextColumn t paragraphs =
    List.map (\para -> p [ css [ pageColumnBlockStyle ] ] [ text (t para) ]) paragraphs


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
        , a [ href "submit story Route [cCc]", css [ callForStoryLinkStyle ] ] [ text (t CallForStoryLinkText) ]
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
