module Stories exposing (suite)

import Html
import Html.Attributes
import I18n.Keys exposing (Key(..))
import Page.Stories.Data exposing (Story)
import Page.Stories.View exposing (view)
import Svg.Styled exposing (metadata)
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import TestUtils exposing (queryFromStyledHtml)


suite : Test
suite =
    let
        storyMinimal : Story
        storyMinimal =
            { title = "A minimal test story"
            , description = "# Some minimal test reource markdown"
            , maybeMetadata = Nothing
            , relatedStoryList = []
            , relatedResourceList = []
            }

        storyFull : Story
        storyFull =
            { title = "A full test story"
            , description = "# Some full test reource markdown"
            , maybeMetadata =
                Just
                    { location = "Test location"
                    , author = "Test author"
                    , images = [ { src = "/images/wildlife-trust-logo.png", alt = "placeholder" } ]
                    }
            , relatedStoryList =
                [ { title = "A related story"
                  , url = "/a-story"
                  }
                , { title = "Another related story"
                  , url = "/another-story"
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
            , test "Story view has a description" <|
                \() ->
                    queryFromStyledHtml (view storyMinimal)
                        |> Query.contains
                            [ Html.p [] [ Html.text storyMinimal.description ]
                            ]
            , test "Story view can have related story teasers" <|
                \() ->
                    queryFromStyledHtml (view storyFull)
                        |> Query.contains
                            [ Html.ul []
                                [ Html.li [] [ Html.a [ Html.Attributes.href "/a-story" ] [ Html.text "A related story" ] ]
                                , Html.li [] [ Html.a [ Html.Attributes.href "/another-story" ] [ Html.text "Another related story" ] ]
                                ]
                            ]
            , test "Story view can have related resource teasers" <|
                \() ->
                    queryFromStyledHtml (view storyFull)
                        |> Query.contains
                            [ Html.ul []
                                [ Html.li [] [ Html.a [ Html.Attributes.href "/a-resource" ] [ Html.text "A related resource" ] ]
                                , Html.li [] [ Html.a [ Html.Attributes.href "/another-resource" ] [ Html.text "Another related resource" ] ]
                                ]
                            ]
            , test "Full story view has an author" <|
                \() ->
                    case storyFull.maybeMetadata of
                        Just metadata ->
                            queryFromStyledHtml (view storyFull)
                                |> Query.contains
                                    [ Html.p
                                        []
                                        [ Html.text metadata.author ]
                                    ]

                        Nothing ->
                            queryFromStyledHtml (view storyFull)
                                |> Query.contains
                                    []
            , test "Full story view has an image" <|
                \() ->
                    case storyFull.maybeMetadata of
                        Just metadata ->
                            queryFromStyledHtml (view storyFull)
                                |> Query.contains
                                    (List.map
                                        (\image -> Html.img [ Html.Attributes.alt image.alt, Html.Attributes.src image.src ] [])
                                        metadata.images
                                    )

                        Nothing ->
                            queryFromStyledHtml (view storyFull)
                                |> Query.contains
                                    []
            ]
        ]
