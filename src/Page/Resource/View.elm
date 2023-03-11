module Page.Resource.View exposing (view)

import Html.Styled exposing (Html, div, h1, p, text)
import Page.Resource.Data
import Shared exposing (Model, Msg)


view : Model -> Page.Resource.Data.Resource -> Html Msg
view model resource =
    div []
        [ h1 [] [ text resource.title ]
        , p [] [ text resource.fullTextMarkdown ]
        ]
