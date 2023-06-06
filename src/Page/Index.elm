module Page.Index exposing (view)

import Css exposing (Style, batch, fontSize, margin2, marginBottom, rem)
import Html.Styled exposing (Html, div, h1, h2, p, text)
import Html.Styled.Attributes exposing (css)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Message exposing (Msg)
import Page.Guides.Data
import Page.Guides.View
import Shared exposing (Model, shuffleList)
import Theme.FluidScale
import Theme.Global exposing (centerContent, contentWrapper, pageColumnBlockStyle, pageColumnStyle, topTwoColumnsWrapperStyle)


view : Model -> Html Msg
view model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    div [ css [ centerContent ] ]
        [ h1 []
            [ text (t HomeTitle) ]
        , div [ css [ contentWrapper ] ]
            [ div [ css [ topTwoColumnsWrapperStyle ] ]
                [ div [ css [ pageColumnStyle ] ]
                    (viewTextColumn t [ WelcomeP1, WelcomeP2, WelcomeP3 ])
                , div [ css [ pageColumnStyle ] ]
                    [ h2 [ css [ teaserSubtitleStyle ] ] [ text (t GuideHighlightsSubtitle) ]
                    , Page.Guides.Data.teaserListFromGuideDict model.language model.content.guides
                        |> shuffleList model.seed
                        |> List.take 2
                        |> Page.Guides.View.viewTeaserList False
                    , h2 [ css [ teaserSubtitleStyle ] ] [ text (t StoryHighlightsSubtitle) ]
                    , Page.Guides.Data.teaserListFromStoryDict model.language model.content.stories
                        |> shuffleList model.seed
                        |> List.take 2
                        |> Page.Guides.View.viewTeaserList False
                    ]
                ]
            , div [ css [ pageColumnStyle ] ]
                (viewTextColumn t
                    [ ExploreGuidesListPlaceholder
                    , ExploreGuidesListPlaceholder
                    , ExploreGuidesListPlaceholder
                    ]
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
        , Theme.FluidScale.fontSize1
        ]
