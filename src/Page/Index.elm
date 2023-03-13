module Page.Index exposing (view)

import Html.Styled exposing (Html, div, p, text)
import Html.Styled.Attributes exposing (css)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Message exposing (Msg)
import Page.Shared.View exposing (GuideTeaser)
import Shared exposing (Model)
import Theme.Global exposing (centerContent)



-- [fFf] replace this with real content


fakeGuideTeasers : List GuideTeaser
fakeGuideTeasers =
    [ "How to help wildlife at school"
    , "How to make a coastal garden"
    , "How to make a woodland edge garden for wildlife"
    , "How to provide bushes for nesting birds"
    , "How to make a hedge for wildlife"
    , "How to make a shrub garden for wildlife"
    , "How to cut out palm oil – not trees"
    , "How to plant a tree"
    , "How to build a hedgehog home"
    , "How to have a plastic- free Halloween"
    , "Change how you travel"
    , "How to use less plastic"
    , "How to make a log shelter"
    , "How to start a wildlife garden from scratch"
    , "How to grow a wildlife- friendly vegetable garden"
    , "How to create a hedgehog hole"
    , "How to create a container garden for wildlife"
    , "How to create a vertical garden"
    , "How to make a bog garden"
    ]
        |> Page.Shared.View.guideTeaserList


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
        , Page.Shared.View.viewGuideTeaserList fakeGuideTeasers
        ]
