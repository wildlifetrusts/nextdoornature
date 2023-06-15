module Page.Index exposing (view)

import Css exposing (Style, backgroundColor, backgroundImage, backgroundPosition, backgroundRepeat, batch, color, column, flexDirection, fontWeight, int, marginBottom, noRepeat, padding, paddingRight, pct, property, rem, right, row, url, width)
import Html.Styled exposing (Html, a, div, h2, p, text)
import Html.Styled.Attributes exposing (css, href)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Message exposing (Msg)
import Page.Guides.Data
import Page.Guides.View
import Page.Shared.View exposing (viewCallForStory)
import Shared exposing (Model, shuffleList)
import Theme.FluidScale
import Theme.Global exposing (centerContent, contentWrapper, pageColumnBlockStyle, pageColumnStyle, primaryHeader, purple, topTwoColumnsWrapperStyle, white, withMediaMobileUp, withMediaTabletPortraitUp)


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
                (viewTextColumn t
                    [ ExploreGuidesListPlaceholder
                    , ExploreGuidesListPlaceholder
                    , ExploreGuidesListPlaceholder
                    ]
                    ++ [ viewCallForStory model.language (t HomeCallForStoryP) ]
                )
            ]
        ]


viewTextColumn : (Key -> String) -> List Key -> List (Html msg)
viewTextColumn t paragraphs =
    List.map (\para -> p [ css [ pageColumnBlockStyle ] ] [ text (t para) ]) paragraphs


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
