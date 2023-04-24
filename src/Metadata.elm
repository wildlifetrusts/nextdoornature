port module Metadata exposing (metadataFromPage, setMetadata)

import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Route exposing (Route(..))


type alias PageMetadata =
    { title : String
    , description : String
    }


metadataFromPage : Route -> Language -> PageMetadata
metadataFromPage page language =
    let
        t : Key -> String
        t =
            translate language
    in
    case page of
        Index ->
            { title = t SiteTitle
            , description = t WelcomeP1
            }

        Guide slug ->
            { title = subPageTitle language slug
            , description = slug
            }

        Guides ->
            { title = subPageTitle language (t GuidesTitle)
            , description = t GuidesMetaDescription
            }

        Story slug ->
            { title = subPageTitle language slug
            , description = slug
            }

        Page slug ->
            { title = subPageTitle language slug
            , description = slug
            }


subPageTitle : Language -> String -> String
subPageTitle language title =
    let
        t : Key -> String
        t =
            translate language
    in
    title ++ " | " ++ t SiteTitle


port setMetadata : PageMetadata -> Cmd msg
