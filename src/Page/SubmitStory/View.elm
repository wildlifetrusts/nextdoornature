module Page.SubmitStory.View exposing (..)

import Css exposing (Style, batch, border, displayFlex, flexGrow, flexShrink, flexWrap, height, hidden, int, overflow, pct, property, rem, width, wrap)
import Html.Styled exposing (Html, div, h2, iframe, img, p, text)
import Html.Styled.Attributes as Attr exposing (css)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Message exposing (Msg)
import Shared exposing (Model)
import Theme.FluidScale
import Theme.Global exposing (centerContent, primaryHeader, roundedCornerStyle)


view : Model -> Html Msg
view model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    div [ css [ centerContent ] ]
        [ primaryHeader [] (t SubmitStoryHeading)
        , submitFlex model
        ]


submitFlex : Model -> Html Msg
submitFlex model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    div
        [ css
            [ batch
                [ displayFlex
                , property "gap" "1rem"
                , flexWrap wrap
                ]
            ]
        ]
        [ description (t SubmitStoryP1) (t SubmitStoryP2)
        , form model
        , imageGrid imageList
        ]


description : String -> String -> Html Msg
description p1 p2 =
    div [ css [ flexChild ] ]
        [ p [ css [ Theme.FluidScale.fontSizeMedium ] ] [ text p1 ]
        , p [] [ text p2 ]
        ]


form : Model -> Html Msg
form model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    div [ css [ batch [ width (pct 100) ], flexChild ] ]
        [ h2 [] [ text (t SubmitFormHeading) ]
        , iframe
            [ Attr.src (t SubmitFormSrc)
            , Attr.title (t SubmitFormTitle)
            , css [ border (rem 0), width (pct 100), height (rem 77) ]
            ]
            []
        ]


imageList : List ( String, String )
imageList =
    [ ( "/images/submitStory/david-clode-eL4ADAsiOR8-unsplash.jpg", "" )
    , ( "/images/submitStory/steve-adams-bY_q4VodUc0-unsplash.jpg", "" )
    , ( "/images/submitStory/kenny-eliason-qo6_mo9dsYg-unsplash.jpg", "" )
    , ( "/images/submitStory/sincerely-media-Agr1YTrzYPI-unsplash.jpg", "" )
    , ( "/images/submitStory/ocg-saving-the-ocean-bWAArZ5M4Ag-unsplash.jpg", "" )
    ]


submitImgStyle : Style
submitImgStyle =
    batch
        [ property "object-fit" "cover"
        , property "aspect-ratio" "9/6"
        , overflow hidden
        , property "object-position" "center bottom"
        ]


submitImgGrid : Style
submitImgGrid =
    batch
        [ property "display" "grid"
        , property "grid-template-columns" "repeat(auto-fit, minmax(280px, 1fr))"
        , property "gap" "1rem"
        ]


flexChild : Style
flexChild =
    batch
        [ flexShrink (int 1)
        , flexGrow (int 1)
        , property "flex-basis" "25rem"
        ]


imageGrid : List ( String, String ) -> Html Msg
imageGrid images =
    div [ css [ submitImgGrid, flexChild ] ]
        (List.map (\( src, alt ) -> gridItem src alt) images)


gridItem : String -> String -> Html Msg
gridItem src alt =
    div [] [ img [ css [ roundedCornerStyle, submitImgStyle ], Attr.src src, Attr.alt alt ] [] ]
