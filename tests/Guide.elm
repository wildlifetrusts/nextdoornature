module Guide exposing (suite)

import Html
import Html.Attributes
import I18n.Keys exposing (Key(..))
import Page.Guide.Data exposing (Guide)
import Page.Guide.View exposing (view)
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector exposing (tag)
import TestUtils exposing (queryFromStyledHtml)


suite : Test
suite =
    let
        guideMinimal : Guide
        guideMinimal =
            { title = "A minimal test guide"
            , slug = "a-guide"
            , fullTextMarkdown = "# Some minimal test reource markdown"
            , summary = "Some minimal test reource markdown"
            , maybeVideo = Nothing
            , maybeAudio = Nothing
            , relatedStoryList = []
            , relateGuideList = []
            }

        guideFull : Guide
        guideFull =
            { title = "A full test guide"
            , slug = "a-guide"
            , fullTextMarkdown = "# Some full test reource markdown"
            , summary = "Some full test reource markdown"
            , maybeVideo =
                Just
                    { title = "A guide video"
                    , src = "https://a.video.test"
                    }
            , maybeAudio =
                Just
                    { title = "An audio guide"
                    , src = "https://an.audio.guide"
                    }
            , relatedStoryList =
                [ { title = "A related story"
                  , slug = "a-story"
                  , image = { src = "/", alt = "" }
                  , description = "test description"
                  }
                , { title = "Another related story"
                  , slug = "another-story"
                  , image = { src = "/", alt = "" }
                  , description = "test description"
                  }
                ]
            , relateGuideList =
                [ { title = "A related guide"
                  , url = "/a-guide"
                  , summary = "A related guide"
                  }
                , { title = "Another related guide"
                  , url = "/another-guide"
                  , summary = "A related guide"
                  }
                ]
            }

        view =
            Page.Guide.View.view
    in
    describe "Guide Page"
        [ describe "View tests"
            [ test "Guide view has title" <|
                \() ->
                    queryFromStyledHtml (view guideMinimal)
                        |> Query.contains
                            [ Html.h1 [] [ Html.text guideMinimal.title ]
                            ]
            , test "Guide view has a body" <|
                \() ->
                    queryFromStyledHtml (view guideMinimal)
                        |> Query.contains
                            [ Html.p [] [ Html.text guideMinimal.fullTextMarkdown ]
                            ]
            , test "Guide view can have a video" <|
                \() ->
                    queryFromStyledHtml (view guideFull)
                        |> Query.has
                            [ tag "iframe" ]
            , test "Guide view can have audio" <|
                \() ->
                    queryFromStyledHtml (view guideFull)
                        |> Query.contains
                            [ Html.text "[fFf] render audio player" ]
            , test "Guide view can have related story teasers" <|
                \() ->
                    queryFromStyledHtml (view guideFull)
                        |> Query.contains
                            [ Html.a [ Html.Attributes.href "/stories/another-story" ] [ Html.text "Another related story" ] ]
            , test "Guide view can have related guide teasers" <|
                \() ->
                    queryFromStyledHtml (view guideFull)
                        |> Query.contains
                            [ Html.ul []
                                [ Html.li [] [ Html.a [ Html.Attributes.href "/a-guide" ] [ Html.text "A related guide" ] ]
                                , Html.li [] [ Html.a [ Html.Attributes.href "/another-guide" ] [ Html.text "Another related guide" ] ]
                                ]
                            ]
            ]
        ]
