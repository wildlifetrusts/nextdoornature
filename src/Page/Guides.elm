module Page.Guides exposing (view)

import Html.Styled exposing (Html, div, h1, text)
import Html.Styled.Attributes exposing (css)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import List
import Message exposing (Msg)
import Page.Guide.Data
import Page.GuideTeaser
import Page.Shared.View
import Shared exposing (Model, Request(..))
import Theme.Global exposing (centerContent, contentWrapper)


view : Model -> Html Msg
view model =
    let
        t : Key -> String
        t =
            translate model.language

        teaserList : List Page.GuideTeaser.GuideTeaser
        teaserList =
            if List.length model.search > 0 then
                model.search

            else if model.language == Welsh then
                Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides

            else
                case model.externalActions of
                    Failure ->
                        Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides

                    Loading ->
                        Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides

                    Success list ->
                        List.concat [ Page.Guide.Data.teaserListFromGuideDict model.language model.content.guides, list ]
    in
    div [ css [ centerContent ] ]
        [ h1 []
            [ text (t GuidesTitle) ]
        , div
            [ css [ contentWrapper ] ]
            [ Page.Shared.View.viewGuideTeaserList True teaserList
            ]
        ]
