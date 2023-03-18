module Page.Guides exposing (view)

import Dict
import Html.Styled exposing (Html, a, div, h1, li, text, ul)
import Html.Styled.Attributes exposing (class, css, href)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Message exposing (Msg)
import Page.Guide.Data exposing (Guide)
import Route
import Shared exposing (Model)
import Theme.Global exposing (centerContent)


view : Model -> Html Msg
view model =
    let
        t =
            translate model.language

        guides =
            List.map
                guideCard
                (List.sortBy
                    .title
                    (Dict.values model.content.guides)
                )
    in
    div [ css [ centerContent ] ]
        [ h1 [] [ text (t GuidesTitle) ]
        , ul [] guides
        ]


guideCard : Guide -> Html Msg
guideCard guide =
    li [ class "guide-card" ]
        [ a [ href (Route.toString (Route.Guide guide.slug)) ] [ text guide.title ] ]
