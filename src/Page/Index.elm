module Page.Index exposing (view)

import Html.Styled exposing (Html, div, p, text)
import Html.Styled.Attributes exposing (css)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Page.Shared exposing (GuideTeaser)
import Shared exposing (Model, Msg)
import Theme.Global exposing (centerContent)



-- [fFf] replace this with real content


fakeGuideTeasers : List GuideTeaser
fakeGuideTeasers =
    [ { title = "How to help wildlife at school"
      , summary = "Whether feeding the birds, or sowing a wildflower patch, setting up wildlife areas in your school makes for happier, healthier and more creative children."
      }
    , { title = "How to make a coastal garden"
      , summary = "Coastal gardening can be a challenge, but with the right plants in the right place, your garden and its wildlife visitors can thrive."
      }
    , { title = "How to make a woodland edge garden for wildlife"
      , summary = "Few of us can contemplate having a wood in our back gardens, but just a few metres is enough to establish this mini-habitat!"
      }
    , { title = "How to provide bushes for nesting birds"
      , summary = "In the spring, birds choose the best locations to build nests, so why not offer them a safe place to settle?"
      }
    , { title = "How to make a hedge for wildlife"
      , summary = "Hedges provide important shelter and protection for wildlife, particularly nesting birds and hibernating insects."
      }
    , { title = "How to make a shrub garden for wildlife"
      , summary = "Woody shrubs and climbers provide food for wildlife, including berries, fruits, seeds, nuts leaves and nectar-rich flowers. So why not plant a shrub garden and see who comes to visit?"
      }
    , { title = "How to cut out palm oil – not trees"
      , summary = "Palm Oil is a cheap, efficient form of vegetable oil, but a lot of species-rich tropical habitat is being destroyed to make way for it."
      }
    , { title = "How to plant a tree "
      , summary = "It might surprise you, but even the smallest of gardens can accommodate a tree!"
      }
    , { title = "How to build a hedgehog home "
      , summary = "By providing safe places for hedgehogs to live, you’re much more likely to see these prickly creatures in your garden. "
      }
    , { title = "How to have a plastic- free Halloween"
      , summary = "Halloween is often a great time for spooky family fun, but unfortunately it is often full of plastic."
      }
    ]
        |> Page.Shared.guideTeaserList


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
        , Page.Shared.viewGuideTeaserList fakeGuideTeasers
        ]
