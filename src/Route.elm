module Route exposing (Route(..), fromUrl)

import Url
import Url.Parser as Parser exposing ((</>), Parser, map, oneOf, s, string, top)


type Route
    = Index
    | Story String
    | StoryIndex
    | Guide String
    | GuideIndex
    | Page String


fromUrl : Url.Url -> Maybe Route
fromUrl url =
    url
        |> Parser.parse routeParser


toString : Route -> String
toString route =
    case route of
        Index ->
            "/"

        Story s ->
            "/stories" ++ "/" ++ s

        StoryIndex ->
            "/stories"

        Guide s ->
            "/guides" ++ "/" ++ s

        GuideIndex ->
            "/guides"

        Page s ->
            "/" ++ s


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Index top
        , map Story (s "stories" </> string)
        , map StoryIndex (s "stories")
        , map Guide (s "guides" </> string)
        , map GuideIndex (s "guides")
        , map Page string
        ]
