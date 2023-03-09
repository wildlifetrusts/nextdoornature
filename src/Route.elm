module Route exposing (Route(..), fromUrl, toString)

import Url
import Url.Parser as Parser exposing (Parser, map, oneOf, s, top)


type Route
    = Index
    | CaseStudy
    | Resource


fromUrl : Url.Url -> Maybe Route
fromUrl url =
    { url | path = url.path }
        |> Parser.parse routeParser


toString : Route -> String -> String
toString route title =
    case route of
        Index ->
            "/"

        CaseStudy ->
            "/case-study" ++ "/" ++ title

        Resource ->
            "/resource" ++ "/" ++ title


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Index top
        , map Resource (s "resource")
        , map CaseStudy (s "case-study")
        ]
