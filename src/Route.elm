module Route exposing (Route(..), fromUrl)

import Url
import Url.Parser as Parser exposing ((</>), Parser, map, oneOf, s, string, top)


type Route
    = Index
    | StoryIndex
    | Story String
    | Resource String


fromUrl : Url.Url -> Maybe Route
fromUrl url =
    url
        |> Parser.parse routeParser


toString : Route -> String
toString route =
    case route of
        Index ->
            "/"

        StoryIndex ->
            "/stories"

        Story s ->
            "/stories" ++ "/" ++ s

        Resource s ->
            "/resource" ++ "/" ++ s


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Index top
        , map StoryIndex (s "stories")
        , map Story (s "stories" </> string)
        , map Resource (s "resource" </> string)
        ]
