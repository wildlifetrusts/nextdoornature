module Route exposing (Route(..), fromUrl, toString)

import Url
import Url.Parser as Parser exposing ((</>), Parser, map, oneOf, s, string, top)


type Route
    = Index
    | Story String
    | SubmitStory
    | Guide String
    | Search
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

        SubmitStory ->
            "/share-story"

        Guide s ->
            "/guides" ++ "/" ++ s

        Search ->
            "/search"

        Page s ->
            "/" ++ s


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Index top
        , map Story (s "stories" </> string)
        , map SubmitStory (s "share-story")
        , map Guide (s "guides" </> string)
        , map Search (s "search")
        , map Page string
        ]
