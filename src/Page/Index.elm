module Page.Index exposing (view)

import Html.Styled exposing (Html, div, p, text)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Shared exposing (Model, Msg)
import Theme.PageTemplate as PageTemplate


view : Model -> Html Msg
view model =
    let
        t =
            translate model.language
    in
    div []
        [ p [] [ text (t WelcomeP1) ]
        , p [] [ text (t WelcomeP2) ]
        , p [] [ text (t WelcomeP3) ]
        ]
