module Route exposing (Route(..), fromUrl, toString)

import Url
import Url.Parser as Parser exposing ((</>), Parser, map, oneOf, s, string, top)


type Route
    = Index
    | Story String
    | Guide String
    | Guides


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

        Guide s ->
            "/guides" ++ "/" ++ s

        Guides ->
            "/guides"


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Index top
        , map Story (s "stories" </> string)
        , map Guide (s "guides" </> string)
        , map Guides (s "guides")
        ]
