module Page.Index exposing (view)

import Html.Styled exposing (Html, div, p, text)
import Html.Styled.Attributes exposing (css)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Message exposing (Msg)
import Page.Guide.Data
import Page.Shared.View
import Shared exposing (Model)
import Theme.Global exposing (contentWrapper, mainInnerStyle, pageColumnBlockStyle, pageColumnStyle, topTwoColumnsWrapperStyle)


view : Model -> Html Msg
view model =
    let
        t =
            translate model.language
    in
    div [ css [ mainInnerStyle, contentWrapper ] ]
        [ div [ css [ topTwoColumnsWrapperStyle ] ]
            [ div [ css [ pageColumnStyle ] ]
                (viewTextColumn t [ WelcomeP1, WelcomeP2, WelcomeP3 ])
            , div [ css [ pageColumnStyle ] ]
                [ List.take 4 (Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides)
                    |> Page.Shared.View.viewGuideTeaserList
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


viewTextColumn : (Key -> String) -> List Key -> List (Html msg)
viewTextColumn t paragraphs =
    List.map (\para -> p [ css [ pageColumnBlockStyle ] ] [ text (t para) ]) paragraphs
