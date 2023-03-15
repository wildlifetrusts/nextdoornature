module Page.Guides exposing (view)

import Html.Styled exposing (Html, div, text)
import Message exposing (Msg)
import Shared exposing (Model)


view : Model -> Html Msg
view _ =
    div [] [ text "Guides index" ]
