module Page.Index exposing (view)

import Html.Styled exposing (Html, div, p, text)
import Html.Styled.Attributes exposing (css)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Message exposing (Msg)
import Page.Guide.Data
import Page.Shared.View
import Shared exposing (Model)
import Theme.Global exposing (centerContent, pageColumnBlockStyle, pageColumnStyle, pageWrapperStyle, topTwoColumnsWrapperStyle)


view : Model -> Html Msg
view model =
    let
        t =
            translate model.language
    in
    div [ css [ centerContent ] ]
        [ div [ css [ pageWrapperStyle ] ]
            [ div [ css [ topTwoColumnsWrapperStyle ] ]
                [ div [ css [ pageColumnStyle ] ]
                    [ p [ css [ pageColumnBlockStyle ] ] [ text (t WelcomeP1) ]
                    , p [ css [ pageColumnBlockStyle ] ] [ text (t WelcomeP2) ]
                    , p [ css [ pageColumnBlockStyle ] ] [ text (t WelcomeP3) ]
                    ]
                , div [ css [ pageColumnStyle ] ]
                    [ Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides
                        |> Page.Shared.View.viewGuideTeaserList
                    ]
                ]
            , div [ css [ pageColumnStyle ] ]
                [ p [ css [ pageColumnBlockStyle ] ] [ text (t ExploreGuidesListPlaceholder) ]
                , p [ css [ pageColumnBlockStyle ] ] [ text (t ExploreGuidesListPlaceholder) ]
                , p [ css [ pageColumnBlockStyle ] ] [ text (t ExploreGuidesListPlaceholder) ]
                ]
            ]
        ]
