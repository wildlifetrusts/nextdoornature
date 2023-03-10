module Page.Resource exposing (view)

import Html.Styled exposing (Html, div)
import I18n.Keys exposing (Key(..))
import Shared exposing (Model, Msg)
import Theme.PageTemplate as PageTemplate


view : Model -> Html Msg
view model =
    div [] []
