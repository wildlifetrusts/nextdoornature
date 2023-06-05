module Page.Index exposing (view)

import Html.Styled exposing (Html, div, h1, p, text)
import Html.Styled.Attributes exposing (css)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Message exposing (Msg)
import Page.Guides.Data
import Page.Guides.View
import Shared exposing (Model)
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
                    [ List.take 2 (Page.Guides.Data.teaserListFromGuideDict model.language model.content.guides)
                        |> Page.Guides.View.viewTeaserList False
                    , List.take 2 (Page.Guides.Data.teaserListFromStoryDict model.language model.content.stories)
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
