module Page.View exposing (view)

import Html.Styled exposing (Html, div, h1, main_, text)
import Html.Styled.Attributes exposing (css)
import Message exposing (Msg)
import Page.Data
import Theme.Global exposing (contentWrapper, mainContainerStyles)
import Theme.Markdown exposing (markdownToHtml)


view : Page.Data.Page -> Html Msg
view page =
    main_ [ css [ mainContainerStyles ] ]
        [ h1 [] [ text page.title ]
        , div [ css [] ] (markdownToHtml page.fullTextMarkdown)
        ]
