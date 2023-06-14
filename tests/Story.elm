module Story exposing (suite)

import Html
import Html.Attributes
import Html.Styled
import I18n.Translate exposing (Language(..))
import Message
import Page.Story.Data exposing (Story)
import Page.Story.View
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector exposing (tag, text)
import TestUtils exposing (queryFromStyledHtml)


suite : Test
suite =
    let
        storyMinimal : Story
        storyMinimal =
            { title = "A minimal test story"
            , slug = "slug"
            , summary = ""
            , fullTextMarkdown = "# Some minimal test resource markdown"
            , maybeLocation = Nothing
            , maybeGroupOrIndividual = Nothing
            , images = []
            }

        storyFull : Story
        storyFull =
            { title = "A full test story"
            , summary = "A summary of this story"
            , fullTextMarkdown = "# Some full test resource markdown\n\nA small paragraph."
            , slug = "slug"
            , maybeLocation = Just "Test location"
            , maybeGroupOrIndividual = Just "Test group"
            , images =
                [ { src = "/images/wildlife-trust-logo.png"
                  , alt = "placeholder"
                  , maybeCaption = Just "caption"
                  , maybeCredit = Just "credit"
                  }
                ]
            }

        view : Story -> Html.Styled.Html Message.Msg
        view =
            Page.Story.View.view English
    in
    describe "Story Page"
        [ describe "View tests"
            [ test "Story view has a body" <|
                \() ->
                    queryFromStyledHtml (view storyMinimal)
                        |> Query.has
                            [ tag "h1"
                            , text "A minimal test story"
                            ]
            , test "Story view has body converts markdown to HTML" <|
                \() ->
                    queryFromStyledHtml (view storyFull)
                        |> Query.has
                            [ tag "h1"
                            , text "Some full test resource markdown"
                            , tag "p"
                            , text "A small paragraph."
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
                    if List.length storyFull.images > 0 then
                        queryFromStyledHtml (view storyFull)
                            |> Query.contains
                                (List.map
                                    (\image -> Html.img [ Html.Attributes.alt image.alt, Html.Attributes.src image.src, Html.Attributes.class "_570ce029" ] [])
                                    storyFull.images
                                )

                    else
                        queryFromStyledHtml (view storyFull)
                            |> Query.contains
                                []
            ]
        ]
