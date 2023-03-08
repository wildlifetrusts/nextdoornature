module Route exposing (Route(..), fromUrl, toString)

import Url
import Url.Parser as Parser exposing (Parser, map, oneOf, top)


type Route
    = Index
    | CaseStudy
    | Resource


fromUrl : Url.Url -> Maybe Route
fromUrl url =
    { url | path = url.path }
        |> Parser.parse routeParser


toString : Route -> String
toString route =
    case route of
        Index ->
            "/"

        CaseStudy ->
            "/case-study"

        Resource ->
            "/resource"


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Index top
        ]
