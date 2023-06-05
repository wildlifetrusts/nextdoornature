module Page.Index exposing (view)

import Html.Styled exposing (Html, div, p, text)
import Html.Styled.Attributes exposing (css)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Message exposing (Msg)
import Page.Guides.Data
import Page.Guides.View
import Shared exposing (Model)
import Theme.Global exposing (centerContent, contentWrapper, pageColumnBlockStyle, pageColumnStyle, primaryHeader, topTwoColumnsWrapperStyle)


view : Model -> Html Msg
view model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    div [ css [ centerContent ] ]
        [ primaryHeader (t HomeTitle)
        , div [ css [ contentWrapper ] ]
            [ div [ css [ topTwoColumnsWrapperStyle ] ]
                [ div [ css [ pageColumnStyle ] ]
                    (viewTextColumn t [ WelcomeP1, WelcomeP2, WelcomeP3 ])
                , div [ css [ pageColumnStyle ] ]
                    [ List.take 4 (Page.Guides.Data.teaserListFromGuideDict model.language model.content.guides)
                        |> Page.Guides.View.viewGuideTeaserList False
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
