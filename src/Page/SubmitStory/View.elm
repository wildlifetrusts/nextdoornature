module Page.SubmitStory.View exposing (view)

import Css exposing (Style, batch, border, height, hidden, margin2, overflow, pct, property, rem, width)
import Html.Styled exposing (Html, div, iframe, img)
import Html.Styled.Attributes as Attr exposing (css)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Message exposing (Msg)
import Page.Data
import Shared exposing (Model)
import Theme.Global exposing (centerContent, primaryHeader, roundedCornerStyle, simpleThreeColumnFlexChildStyle, simpleThreeColumnFlexStyle, withMediaTabletLandscapeUp)
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
            [ simpleThreeColumnFlexStyle, outerMarginStyle ]
        ]
        [ viewDescription page
        , viewForm model
        , viewImageGrid imageList
        ]


viewDescription : Page.Data.Page -> Html Msg
viewDescription page =
    div [ css [ simpleThreeColumnFlexChildStyle ] ]
        (markdownToHtml page.fullTextMarkdown)


viewForm : Model -> Html Msg
viewForm model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    div [ css [ batch [ width (pct 100) ], simpleThreeColumnFlexChildStyle ] ]
        [ iframe
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


outerMarginStyle : Style
outerMarginStyle =
    batch
        [ withMediaTabletLandscapeUp
            [ margin2 (rem 3) (rem 0)
            ]
        ]


viewImageGrid : List ( String, String ) -> Html Msg
viewImageGrid images =
    div [ css [ submitImgGridStyle, simpleThreeColumnFlexChildStyle ] ]
        (List.map (\( src, alt ) -> viewGridItem src alt) images)


viewGridItem : String -> String -> Html Msg
viewGridItem src alt =
    div [] [ img [ css [ roundedCornerStyle, submitImgStyle ], Attr.src ("/images/submitStory/" ++ src), Attr.alt alt ] [] ]
