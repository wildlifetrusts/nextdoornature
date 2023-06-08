port module Metadata exposing (PageMetadata, metadataFromPage, setMetadata)

import Dict
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, dictFromLanguage, translate)
import Route exposing (Route(..))
import Shared exposing (Content)


type alias PageMetadata =
    { title : String
    , description : String
    }


defaultMetadata : Language -> PageMetadata
defaultMetadata language =
    let
        t : Key -> String
        t =
            translate language
    in
    { title = t SiteTitle, description = t WelcomeP1 }


metadataFromPage : Route -> Language -> Content -> PageMetadata
metadataFromPage page language content =
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
            case metadataFromSlug slug (dictFromLanguage language content.guides) of
                Just metadata ->
                    { metadata | title = subPageTitle language metadata.title }

                Nothing ->
                    defaultMetadata language

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


metadataFromSlug :
    String
    -> Dict.Dict String { a | summary : String, title : String }
    -> Maybe PageMetadata
metadataFromSlug slug contentDict =
    case Dict.get slug contentDict of
        Just content ->
            Just { title = content.title, description = content.summary }

        Nothing ->
            Nothing


subPageTitle : Language -> String -> String
subPageTitle language title =
    let
        t : Key -> String
        t =
            translate language
    in
    title ++ " | " ++ t SiteTitle


port setMetadata : PageMetadata -> Cmd msg
