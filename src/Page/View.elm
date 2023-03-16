module Page.View exposing (view)

import Html.Styled exposing (Html, div, h1, text)
import Message exposing (Msg)
import Page.Data
import Theme.Markdown exposing (markdownToHtml)


view : Page.Data.Page -> Html Msg
view page =
    div []
        [ h1 [] [ text page.title ]
        , div [] (markdownToHtml page.fullTextMarkdown)
        ]
