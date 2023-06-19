module Page.View exposing (view)

import Css exposing (Style, batch, maxWidth, minHeight, px)
import Html.Styled exposing (Html, div)
import Html.Styled.Attributes exposing (css)
import Message exposing (Msg)
import Page.Data
import Theme.Global exposing (centerContent, maxTabletPortrait, primaryHeader)
import Theme.Markdown exposing (markdownToHtml)


view : Page.Data.Page -> Html Msg
view page =
    div [ css [ centerContent, ancillaryPageTextContainerStyle ] ]
        [ primaryHeader [] page.title
        , div [] (markdownToHtml page.fullTextMarkdown)
        ]


ancillaryPageTextContainerStyle : Style
ancillaryPageTextContainerStyle =
    batch
        [ maxWidth (px maxTabletPortrait)
        , minHeight
            (px 300)
        ]
