module Page.Index exposing (view)

import Html.Styled exposing (Html, div, p, text)
import Html.Styled.Attributes exposing (css)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Shared exposing (Model, Msg)
import Theme.Global exposing (centerContent)


view : Model -> Html Msg
view model =
    let
        t =
            translate model.language
    in
    div [ css [ centerContent ] ]
        [ p [] [ text (t WelcomeP1) ]
        , p [] [ text (t WelcomeP2) ]
        , p [] [ text (t WelcomeP3) ]
        ]
