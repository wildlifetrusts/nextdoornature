module Route exposing (Route(..), fromUrl)

import Url
import Url.Parser as Parser exposing ((</>), Parser, map, oneOf, s, string, top)


type Route
    = Index
    | CaseStudyIndex
    | CaseStudy String
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

        CaseStudyIndex ->
            "/case-study"

        CaseStudy s ->
            "/case-study" ++ "/" ++ s

        Resource s ->
            "/resource" ++ "/" ++ s


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Index top
        , map CaseStudyIndex (s "case-study")
        , map CaseStudy (s "case-study" </> string)
        , map Resource (s "resource" </> string)
        ]
