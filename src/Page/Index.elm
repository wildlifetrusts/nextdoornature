module Page.Index exposing (view)

import Css exposing (Style, backgroundImage, backgroundPosition, backgroundRepeat, backgroundSize, batch, bold, center, color, contain, display, em, fontFamilies, fontSize, fontWeight, height, hex, inlineBlock, marginLeft, noRepeat, none, rem, textDecoration, url, width)
import Html.Styled exposing (Html, a, div, h2, p, span, text)
import Html.Styled.Attributes exposing (css, href)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Message exposing (Msg)
import Page.Guide.Data
import Page.Shared.View
import Shared exposing (Model)
import Theme.Global exposing (centerContent, mainContainerStyles, pageColumnBlockStyle, pageColumnStyle, topTwoColumnsWrapperStyle)


type alias GuideTheme =
    { name : String
    , description : String
    , slug : String
    }


guidesByTheme : List GuideTheme
guidesByTheme =
    [ { name = "Alpha", description = "A theme about Alpha things", slug = "alpha" }
    , { name = "Beta", description = "A theme about Beta things", slug = "beta" }
    , { name = "Cappa", description = "A theme about Cappa things", slug = "cappa" }
    ]


view : Model -> Html Msg
view model =
    let
        t =
            translate model.language

        exploreGuideLink : GuideTheme -> Html msg
        exploreGuideLink guideTheme =
            a [ href ("/explore/" ++ guideTheme.slug), css [ guideLinkStyle ] ]
                [ h2 [ css [ guideLinkTitleStyle ] ] [ text guideTheme.name ]
                , span [] [ text " — " ]
                , div [ css [ guideLinkDescriptionStyle ] ] [ text guideTheme.description ]
                , div [ css [ guideLinkArrowStyle ] ] []
                ]
    in
    div [ css [ centerContent ] ]
        [ div [ css [ mainContainerStyles ] ]
            [ div [ css [ topTwoColumnsWrapperStyle ] ]
                [ div [ css [ pageColumnStyle ] ]
                    (viewTextColumn t [ WelcomeP1, WelcomeP2, WelcomeP3 ])
                , div [ css [ pageColumnStyle ] ]
                    [ List.take 4 (Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides)
                        |> Page.Shared.View.viewGuideTeaserList
                    ]
                ]
            , div [ css [ pageColumnStyle ] ]
                ([ h2 [] [ text "Explore Guides by Theme" ]
                 ]
                    ++ List.map exploreGuideLink guidesByTheme
                )
            ]
        ]


viewTextColumn : (Key -> String) -> List Key -> List (Html msg)
viewTextColumn t paragraphs =
    List.map (\para -> p [ css [ pageColumnBlockStyle ] ] [ text (t para) ]) paragraphs


guideLinkStyle : Style
guideLinkStyle =
    batch
        [ textDecoration none
        ]


guideLinkTitleStyle : Style
guideLinkTitleStyle =
    batch
        [ display inlineBlock
        , fontSize (rem 1)
        , fontFamilies [ "Rubik", "sans serif" ]
        , fontWeight bold
        ]


guideLinkDescriptionStyle : Style
guideLinkDescriptionStyle =
    batch
        [ display inlineBlock
        , color (hex "#000")
        ]


guideLinkArrowStyle : Style
guideLinkArrowStyle =
    batch
        [ display inlineBlock
        , width (em 1)
        , height (em 1)
        , backgroundImage (url "/images/arrow-right-purple.svg")
        , backgroundSize contain
        , backgroundPosition center
        , backgroundRepeat noRepeat
        , marginLeft (em 0.5)
        ]
