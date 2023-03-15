module Stories exposing (suite)

import Html
import Html.Attributes
import I18n.Keys exposing (Key(..))
import Page.Stories.Data exposing (Story)
import Page.Stories.View exposing (view)
import Svg.Styled exposing (metadata)
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector exposing (tag, classes, text)
import TestUtils exposing (queryFromStyledHtml)

suite : Test
suite =
    let
        storyMinimal : Story
        storyMinimal =
            { title = "A minimal test story"
            , slug = "slug"
            , fullTextMarkdown = "# Some minimal test reource markdown"
            , maybeLocation = Nothing
            , maybeGroupOrIndividual = Nothing
            , maybeImages = Nothing
            , relatedGuideList = []
            }

        storyFull : Story
        storyFull =
            { title = "A full test story"
            , fullTextMarkdown = "# Some full test reource markdown\n\nA small paragraph."
            , slug = "slug"
            , maybeLocation = Just "Test location"
            , maybeGroupOrIndividual = Just "Test group"
            , maybeImages = Just [ { src = "/images/wildlife-trust-logo.png", alt = "placeholder" } ]
            , relatedGuideList =
                [ { title = "A related guide"
                  , url = "/a-guide"
                  }
                , { title = "Another related guide"
                  , url = "/another-guide"
                  }
                ]
            }

        view =
            Page.Stories.View.view
    in
    describe "Story Page"
        [ describe "View tests"
            [ test "Story view has title" <|
                \() ->
                    queryFromStyledHtml (view storyMinimal)
                        |> Query.contains
                            [ Html.h1 [] [ Html.text storyMinimal.title ]
                            ]
            , test "Story view has body that is HTML" <|
                \() ->
                    queryFromStyledHtml (view storyFull)
                        |> Query.has
                           [ tag "h1", text "Some full test reource markdown"
                           , tag "p", text "A small paragraph."
                           ]
            , test "Story view can have related guide teasers" <|
                \() ->
                    queryFromStyledHtml (view storyFull)
                        |> Query.contains
                            [ Html.ul []
                                [ Html.li [] [ Html.a [ Html.Attributes.href "/a-guide" ] [ Html.text "A related guide" ] ]
                                , Html.li [] [ Html.a [ Html.Attributes.href "/another-guide" ] [ Html.text "Another related guide" ] ]
                                ]
                            ]
            , test "Full story view has an author" <|
                \() ->
                    case storyFull.maybeGroupOrIndividual of
                        Just groupOrIndividual ->
                            queryFromStyledHtml (view storyFull)
                                |> Query.contains
                                    [ Html.p
                                        []
                                        [ Html.text groupOrIndividual ]
                                    ]

                        Nothing ->
                            queryFromStyledHtml (view storyFull)
                                |> Query.contains
                                    []
            , test "Full story view has an image" <|
                \() ->
                    case storyFull.maybeImages of
                        Just images ->
                            queryFromStyledHtml (view storyFull)
                                |> Query.contains
                                    (List.map
                                        (\image -> Html.img [ Html.Attributes.alt image.alt, Html.Attributes.src image.src ] [])
                                        images
                                    )

                        Nothing ->
                            queryFromStyledHtml (view storyFull)
                                |> Query.contains
                                    []
            ]
        ]
