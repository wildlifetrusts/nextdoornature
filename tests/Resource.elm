module Resource exposing (suite)

import Expect exposing (Expectation)
import Html
import Html.Attributes
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Page.Resource.Data exposing (Resource)
import Page.Resource.View exposing (view)
import Set
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, containing, tag, text)
import TestUtils exposing (queryFromStyledHtml)


suite : Test
suite =
    let
        resourceMinimal : Resource
        resourceMinimal =
            { title = "A minimal test resource"
            , fullTextMarkdown = "# Some minimal test reource markdown"
            , maybeVideo = Nothing
            , maybeAudio = Nothing
            , relatedStoryList = []
            , relatedResourceList = []
            }

        resourceFull : Resource
        resourceFull =
            { title = "A full test resource"
            , fullTextMarkdown = "# Some full test reource markdown"
            , maybeVideo =
                Just
                    { title = "A resource video"
                    , src = "https://a.video.test"
                    }
            , maybeAudio =
                Just
                    { title = "An audio guide"
                    , src = "https://an.audio.guide"
                    }
            , relatedStoryList =
                [ { title = "A related case study"
                  , url = "/a-case-study"
                  }
                , { title = "Another related case study"
                  , url = "/another-case-study"
                  }
                ]
            , relatedResourceList =
                [ { title = "A related resource"
                  , url = "/a-resource"
                  }
                , { title = "Another related resource"
                  , url = "/another-resource"
                  }
                ]
            }

        view =
            Page.Resource.View.view
    in
    describe "Resource Page"
        [ describe "View tests"
            [ test "Resource view has title" <|
                \() ->
                    queryFromStyledHtml (view resourceMinimal)
                        |> Query.contains
                            [ Html.h1 [] [ Html.text resourceMinimal.title ]
                            ]
            , test "Resource view has a body" <|
                \() ->
                    queryFromStyledHtml (view resourceMinimal)
                        |> Query.contains
                            [ Html.p [] [ Html.text resourceMinimal.fullTextMarkdown ]
                            ]
            , test "Resource view can have a video" <|
                \() ->
                    queryFromStyledHtml (view resourceFull)
                        |> Query.has
                            [ tag "iframe" ]
            , test "Resource view can have audio" <|
                \() ->
                    queryFromStyledHtml (view resourceFull)
                        |> Query.contains
                            [ Html.text "[fFf] render audio player" ]
            , test "Resource view can have related case study teasers" <|
                \() ->
                    queryFromStyledHtml (view resourceFull)
                        |> Query.contains
                            [ Html.ul []
                                [ Html.li [] [ Html.a [ Html.Attributes.href "/a-case-study" ] [ Html.text "A related case study" ] ]
                                , Html.li [] [ Html.a [ Html.Attributes.href "/another-case-study" ] [ Html.text "Another related case study" ] ]
                                ]
                            ]
            , test "Resource view can have related resource teasers" <|
                \() ->
                    queryFromStyledHtml (view resourceFull)
                        |> Query.contains
                            [ Html.ul []
                                [ Html.li [] [ Html.a [ Html.Attributes.href "/a-resource" ] [ Html.text "A related resource" ] ]
                                , Html.li [] [ Html.a [ Html.Attributes.href "/another-resource" ] [ Html.text "Another related resource" ] ]
                                ]
                            ]
            ]
        ]
