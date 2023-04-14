module Page exposing (suite)

import Html
import I18n.Keys exposing (Key(..))
import Page.Data
import Page.View
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import TestUtils exposing (queryFromStyledHtml)


suite : Test
suite =
    let
        page : Page.Data.Page
        page =
            { title = "A test page"
            , slug = "a-page"
            , fullTextMarkdown = "# Some markdown\n\nA small paragraph."
            }

        view =
            Page.View.view
    in
    describe "Guide Page"
        [ describe "View tests"
            [ test "Page view has title" <|
                \() ->
                    queryFromStyledHtml (view page)
                        |> Query.contains
                            [ Html.h1 [] [ Html.text "A test page" ]
                            ]
            , test "Page view has body that is HTML" <|
                \() ->
                    queryFromStyledHtml (view page)
                        |> Query.has
                            [ Selector.tag "h1"
                            , Selector.text "Some markdown"
                            , Selector.tag "p"
                            , Selector.text "A small paragraph."
                            ]
            ]
        ]