module Page.Guides exposing (view)

import Dict
import Html.Styled exposing (Html, a, div, h1, li, text, ul)
import Html.Styled.Attributes exposing (class, css, href)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import List exposing (concat)
import Message exposing (Msg)
import Page.Guide.Data exposing (Guide)
import Page.Shared exposing (GuideTeaser)
import Page.Shared.View
import Route
import Shared exposing (Model, Request(..))
import Theme.Global exposing (centerContent)


view : Model -> Html Msg
view model =
    let
        t =
            translate model.language

        teaserList : List GuideTeaser
        teaserList =
            case model.externalActions of
                Failure ->
                    Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides

                Loading ->
                    Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides

                Success list ->
                    concat [ Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides, list ]
    in
    div [ css [ centerContent ] ]
        [ h1 [] [ text (t GuidesTitle) ]
        , Page.Shared.View.viewGuideTeaserList teaserList
        ]


guideCard : Guide -> Html Msg
guideCard guide =
    li [ class "guide-card" ]
        [ a [ href (Route.toString (Route.Guide guide.slug)) ] [ text guide.title ] ]
