module Page.Story exposing (view)

import Html.Styled exposing (Html, div, text)
import Shared exposing (Model, Msg)


view : Model -> Html Msg
view model =
    div [] [ text "Story content" ]
