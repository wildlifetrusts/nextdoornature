module Page.SubmitStory.View exposing (..)

import Css exposing (Style, batch, hidden, maxWidth, overflow, pct, property, width)
import Css.Transitions exposing (objectPosition2)
import Html.Styled exposing (Html, div, h2, iframe, img, li, p, text, ul)
import Html.Styled.Attributes as Attr exposing (attribute, css)
import I18n.Translate exposing (Language(..))
import Message exposing (Msg)
import Shared exposing (Model)
import Theme.Global exposing (centerContent, featureImageStyle, listStyleNone, primaryHeader, roundedCornerStyle)


view : Model -> Html Msg
view model =
    div [ css [ centerContent ] ]
        [ primaryHeader [] "Share your story"
        , description
        , form model
        , images
        ]


description : Html Msg
description =
    div []
        [ p [] [ text "[cCc] Case studies are a vital tool  in helping others achieve success - Lorem ipsum dolor sit amet consectetur adipisicing elit. Magni esse sequi iste eligendi nobis, pariatur repellat itaque voluptatum ab ad eos animi, asperiores dolores repellendus? Tenetur, minima! Fugiat, soluta corrupti?" ]
        , p [] [ text "[cCc] By submitting  a case study Lorem ipsum dolor sit amet consectetur adipisicing elit. Magni esse sequi iste eligendi nobis, pariatur repellat itaque voluptatum ab ad eos animi, asperiores dolores repellendus? Tenetur, minima! Fugiat, soluta corrupti?" ]
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
                        , Attr.height 1000
                        ]
                        []

                Welsh ->
                    -- this would need to be a separate welsh form
                    iframe
                        [ Attr.src "https://teamwildertest.formstack.com/forms/teamwilder_test"
                        , Attr.title "teamwilder_test"
                        , Attr.width 600
                        , Attr.height 1000
                        ]
                        []
    in
    div [ css [ batch [ width (pct 100) ] ] ]
        [ h2 [] [ text "your details" ]
        , formstack
        ]


images : Html Msg
images =
    ul [ attribute "role" "list", css [ listStyleNone ] ]
        [ li [] [ img [ css [ roundedCornerStyle, submitImgStyle ], Attr.src "./public/images/submitStory/david-clode-eL4ADAsiOR8-unsplash.jpg", Attr.alt "" ] [] ]
        , li [] [ img [ css [ roundedCornerStyle, submitImgStyle ], Attr.src "./public/images/submitStory/steve-adams-bY_q4VodUc0-unsplash.jpg", Attr.alt "" ] [] ]
        , li [] [ img [ css [ roundedCornerStyle, submitImgStyle ], Attr.src "./public/images/submitStory/kenny-eliason-qo6_mo9dsYg-unsplash.jpg", Attr.alt "" ] [] ]
        , li [] [ img [ css [ roundedCornerStyle, submitImgStyle ], Attr.src "./public/images/submitStory/sincerely-media-Agr1YTrzYPI-unsplash.jpg", Attr.alt "" ] [] ]
        , li [] [ img [ css [ roundedCornerStyle, submitImgStyle ], Attr.src "./public/images/submitStory/ocg-saving-the-ocean-bWAArZ5M4Ag-unsplash.jpg", Attr.alt "" ] [] ]
        ]


submitImgStyle : Style
submitImgStyle =
    batch
        [ property "object-fit" "cover"
        , property "aspect-ratio" "9/6"
        , overflow hidden
        , property "object-position" "center bottom"
        ]
