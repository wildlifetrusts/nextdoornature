module Guide exposing (suite)

import Html
import Html.Attributes
import Html.Styled
import I18n.Translate exposing (Language(..))
import Message
import Page.Guide.Data exposing (Guide, GuideListItem, defaultGuideImage)
import Page.Guide.View
import Page.Story.Data exposing (StoryTeaser)
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector exposing (tag, text)
import TestUtils exposing (queryFromStyledHtml)


suite : Test
suite =
    let
        guideMinimal : Guide
        guideMinimal =
            { title = "A minimal test guide"
            , slug = "a-guide"
            , fullTextMarkdown = "## Some minimal test resource markdown"
            , summary = "Some minimal test resource markdown"
            , maybeImage = Nothing
            , maybeVideo = Nothing
            , maybeAudio = Nothing
            , relatedStoryList = []
            , relatedGuideList = []
            , categorySlug = "admin-and-info"
            }

        guideFull : Guide
        guideFull =
            { title = "A full test guide"
            , slug = "a-guide"
            , fullTextMarkdown = "## Some full test resource markdown\n\nA small paragraph."
            , summary = "Some full test resource markdown"
            , maybeImage = Just defaultGuideImage
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
                [ "A related story"
                , "Another related story"
                ]
            , relatedGuideList =
                [ "A related guide"
                , "Another related guide"
                ]
            , categorySlug = "admin-and-info"
            }

        allGuideList : List GuideListItem
        allGuideList =
            [ { titleKey = "A related guide"
              , slug = "a-guide"
              , cy = { title = "" }
              , en = { title = "A related guide" }
              }
            , { titleKey = "Another related guide"
              , slug = "another-guide"
              , cy = { title = "" }
              , en = { title = "Another related guide" }
              }
            ]

        allStoryList : List StoryTeaser
        allStoryList =
            [ { titleKey = "A related story"
              , slug = "a-related-story"
              , cy =
                    { title = ""
                    , maybeImage = Nothing
                    }
              , en =
                    { title = "A related story"
                    , maybeImage = Nothing
                    }
              }
            , { titleKey = "Another related story"
              , slug = "another-story"
              , cy =
                    { title = ""
                    , maybeImage = Nothing
                    }
              , en =
                    { title = "Another related story"
                    , maybeImage = Nothing
                    }
              }
            ]

        view :
            Guide
            -> List GuideListItem
            -> List StoryTeaser
            -> Html.Styled.Html Message.Msg
        view =
            Page.Guide.View.view English
    in
    describe "Guide Page"
        [ describe "View tests"
            [ test "Guide view has body that is HTML" <|
                \() ->
                    queryFromStyledHtml (view guideMinimal allGuideList allStoryList)
                        |> Query.has
                            [ tag "h2"
                            , text "Some minimal test resource markdown"
                            ]
            , test "Guide view has body with h2 and p" <|
                \() ->
                    queryFromStyledHtml (view guideFull allGuideList allStoryList)
                        |> Query.has
                            [ tag "h2"
                            , text "Some full test resource markdown"
                            , tag "p"
                            , text "A small paragraph."
                            ]
            , test "Guide view can have a video" <|
                \() ->
                    queryFromStyledHtml (view guideFull allGuideList allStoryList)
                        |> Query.has
                            [ tag "iframe" ]
            , test "Guide view can have audio" <|
                \() ->
                    queryFromStyledHtml (view guideFull allGuideList allStoryList)
                        |> Query.contains
                            [ Html.text "[fFf] render audio player" ]
            , test "Guide view can have related story teasers" <|
                \() ->
                    queryFromStyledHtml (view guideFull allGuideList allStoryList)
                        |> Query.contains
                            [ Html.a [ Html.Attributes.href "/stories/another-story" ] [ Html.text "Another related story" ] ]
            , test "Guide view can have related guide teasers" <|
                \() ->
                    queryFromStyledHtml (view guideFull allGuideList allStoryList)
                        |> Query.contains
                            [ Html.li []
                                [ Html.a [ Html.Attributes.href "/guides/a-guide" ] [ Html.text "A related guide" ]
                                ]
                            , Html.li []
                                [ Html.a [ Html.Attributes.href "/guides/another-guide" ] [ Html.text "Another related guide" ]
                                ]
                            ]
            ]
        ]
