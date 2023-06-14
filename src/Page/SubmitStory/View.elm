module Page.SubmitStory.View exposing (view)

import Css exposing (Style, batch, border, displayFlex, flexGrow, flexShrink, flexWrap, height, hidden, int, overflow, pct, property, rem, width, wrap)
import Html.Styled exposing (Html, div, h2, iframe, img, text)
import Html.Styled.Attributes as Attr exposing (css)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Message exposing (Msg)
import Page.Data
import Shared exposing (Model)
import Theme.Global exposing (centerContent, primaryHeader, roundedCornerStyle)
import Theme.Markdown exposing (markdownToHtml)


view : Model -> Page.Data.Page -> Html Msg
view model page =
    div [ css [ centerContent ] ]
        [ primaryHeader [] page.title
        , viewSubmitFlex model page
        ]


viewSubmitFlex : Model -> Page.Data.Page -> Html Msg
viewSubmitFlex model page =
    div
        [ css
            [ batch
                [ displayFlex
                , property "gap" "1rem"
                , flexWrap wrap
                ]
            ]
        ]
        [ viewDescription page
        , viewForm model
        , viewImageGrid imageList
        ]


viewDescription : Page.Data.Page -> Html Msg
viewDescription page =
    div [ css [ flexChildStyle ] ]
        (markdownToHtml page.fullTextMarkdown)


viewForm : Model -> Html Msg
viewForm model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    div [ css [ batch [ width (pct 100) ], flexChildStyle ] ]
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
    [ ( "david-clode-eL4ADAsiOR8-unsplash.jpg", "" )
    , ( "steve-adams-bY_q4VodUc0-unsplash.jpg", "" )
    , ( "kenny-eliason-qo6_mo9dsYg-unsplash.jpg", "" )
    , ( "sincerely-media-Agr1YTrzYPI-unsplash.jpg", "" )
    , ( "ocg-saving-the-ocean-bWAArZ5M4Ag-unsplash.jpg", "" )
    ]


submitImgStyle : Style
submitImgStyle =
    batch
        [ property "object-fit" "cover"
        , property "aspect-ratio" "9/6"
        , overflow hidden
        , property "object-position" "center bottom"
        ]


submitImgGridStyle : Style
submitImgGridStyle =
    batch
        [ property "display" "grid"
        , property "grid-template-columns" "repeat(auto-fit, minmax(290px, 1fr))"
        , property "gap" "1rem"
        ]


flexChildStyle : Style
flexChildStyle =
    batch
        [ flexShrink (int 1)
        , flexGrow (int 1)
        , property "flex-basis" "25rem"
        ]


viewImageGrid : List ( String, String ) -> Html Msg
viewImageGrid images =
    div [ css [ submitImgGridStyle, flexChildStyle ] ]
        (List.map (\( src, alt ) -> viewGridItem src alt) images)


viewGridItem : String -> String -> Html Msg
viewGridItem src alt =
    div [] [ img [ css [ roundedCornerStyle, submitImgStyle ], Attr.src ("/images/submitStory/" ++ src), Attr.alt alt ] [] ]
