module Story exposing (suite)

import Html
import Html.Attributes
import Html.Styled
import Message
import Page.Shared.Data exposing (defaultTeaserImage)
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
            , fullTextMarkdown = "# Some minimal test reource markdown"
            , maybeLocation = Nothing
            , maybeGroupOrIndividual = Nothing
            , images = []
            , relatedGuideList = []
            }

        storyFull : Story
        storyFull =
            { title = "A full test story"
            , fullTextMarkdown = "# Some full test reource markdown\n\nA small paragraph."
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
            , relatedGuideList =
                [ { title = "A related guide"
                  , url = "/a-guide"
                  , summary = "A related guide"
                  , maybeImage = Just defaultTeaserImage
                  }
                , { title = "Another related guide"
                  , url = "/another-guide"
                  , summary = "A related guide"
                  , maybeImage = Just defaultTeaserImage
                  }
                ]
            }

        view : Story -> Html.Styled.Html Message.Msg
        view =
            Page.Story.View.view
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
                            [ tag "h1"
                            , text "Some full test reource markdown"
                            , tag "p"
                            , text "A small paragraph."
                            ]
            , test "Story view can have related guide teasers" <|
                \() ->
                    queryFromStyledHtml (view storyFull)
                        |> Query.contains
                            [ Html.p [] [ Html.a [ Html.Attributes.href "/a-guide" ] [ Html.text "A related guide" ] ]
                            , Html.p [] [ Html.a [ Html.Attributes.href "/another-guide" ] [ Html.text "Another related guide" ] ]
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
                                    (\image -> Html.img [ Html.Attributes.alt image.alt, Html.Attributes.src image.src ] [])
                                    storyFull.images
                                )

                    else
                        queryFromStyledHtml (view storyFull)
                            |> Query.contains
                                []
            ]
        ]
