module Page.View exposing (view)

import Html.Styled exposing (Html, div)
import Html.Styled.Attributes exposing (css)
import Message exposing (Msg)
import Page.Data
import Theme.Global exposing (centerContent, primaryHeader)
import Theme.Markdown exposing (markdownToHtml)


view : Page.Data.Page -> Html Msg
view page =
    div [ css [ centerContent ] ]
        [ primaryHeader [] page.title
        , div [] (markdownToHtml page.fullTextMarkdown)
        ]
