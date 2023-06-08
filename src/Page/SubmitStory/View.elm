module Page.SubmitStory.View exposing (..)

import Css exposing (Style, batch, displayFlex, flexGrow, flexShrink, flexWrap, hidden, int, overflow, pct, property, width, wrap)
import Html.Styled exposing (Html, div, h2, iframe, img, li, p, text, ul)
import Html.Styled.Attributes as Attr exposing (attribute, css)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Message exposing (Msg)
import Shared exposing (Model)
import Theme.FluidScale
import Theme.Global exposing (centerContent, listStyleNone, primaryHeader, roundedCornerStyle)


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
        , images
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
        formstack =
            case model.language of
                English ->
                    iframe
                        [ Attr.src "https://teamwildertest.formstack.com/forms/teamwilder_test"
                        , Attr.title "teamwilder_test"

                        -- these attributes are modified from those supplied by formstack
                        , Attr.attribute "width" "100%"
                        , Attr.height 1200
                        ]
                        []

                Welsh ->
                    -- this would need to be a separate welsh form
                    iframe
                        [ Attr.src "https://teamwildertest.formstack.com/forms/teamwilder_test"
                        , Attr.title "teamwilder_test"
                        , Attr.width 600
                        , Attr.height 1200
                        ]
                        []
    in
    div [ css [ batch [ width (pct 100) ], flexChild ] ]
        [ h2 [] [ text "your details" ]
        , formstack
        ]


images : Html Msg
images =
    ul [ attribute "role" "list", css [ listStyleNone, submitImgGrid, flexChild ] ]
        [ li [] [ img [ css [ roundedCornerStyle, submitImgStyle ], Attr.src "/images/submitStory/david-clode-eL4ADAsiOR8-unsplash.jpg", Attr.alt "" ] [] ]
        , li [] [ img [ css [ roundedCornerStyle, submitImgStyle ], Attr.src "/images/submitStory/steve-adams-bY_q4VodUc0-unsplash.jpg", Attr.alt "" ] [] ]
        , li [] [ img [ css [ roundedCornerStyle, submitImgStyle ], Attr.src "/images/submitStory/kenny-eliason-qo6_mo9dsYg-unsplash.jpg", Attr.alt "" ] [] ]
        , li [] [ img [ css [ roundedCornerStyle, submitImgStyle ], Attr.src "/images/submitStory/sincerely-media-Agr1YTrzYPI-unsplash.jpg", Attr.alt "" ] [] ]
        , li [] [ img [ css [ roundedCornerStyle, submitImgStyle ], Attr.src "/images/submitStory/ocg-saving-the-ocean-bWAArZ5M4Ag-unsplash.jpg", Attr.alt "" ] [] ]
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
