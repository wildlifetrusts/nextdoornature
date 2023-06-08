port module Metadata exposing (PageMetadata, metadataFromPage, setMetadata)

import Dict
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, dictFromLanguage, translate)
import Route exposing (Route(..))
import Shared exposing (Content)


type alias PageMetadata =
    { title : String
    , description : String
    , imageSrc : String
    }


defaultMetaImageSrc =
    "/images/default-meta-image.jpg"


defaultMetadata : Language -> PageMetadata
defaultMetadata language =
    let
        t : Key -> String
        t =
            translate language
    in
    { title = t SiteTitle
    , description = t WelcomeP1
    , imageSrc = defaultMetaImageSrc
    }


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
            , imageSrc = defaultMetaImageSrc
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
            , imageSrc = defaultMetaImageSrc
            }

        Story slug ->
            { title = subPageTitle language slug
            , description = slug
            , imageSrc = defaultMetaImageSrc
            }

        Page slug ->
            { title = subPageTitle language slug
            , description = slug
            , imageSrc = defaultMetaImageSrc
            }


metadataFromSlug :
    String
    ->
        Dict.Dict
            String
            { a
                | summary : String
                , title : String
                , maybeImage : Maybe { b | src : String }
            }
    -> Maybe PageMetadata
metadataFromSlug slug contentDict =
    case Dict.get slug contentDict of
        Just content ->
            Just
                { title = content.title
                , description = content.summary
                , imageSrc = imageSrcFromMaybeImage content.maybeImage
                }

        Nothing ->
            Nothing


imageSrcFromMaybeImage : Maybe { a | src : String } -> String
imageSrcFromMaybeImage maybeImage =
    case maybeImage of
        Just anImage ->
            anImage.src

        Nothing ->
            defaultMetaImageSrc


subPageTitle : Language -> String -> String
subPageTitle language title =
    let
        t : Key -> String
        t =
            translate language
    in
    title ++ " | " ++ t SiteTitle


port setMetadata : PageMetadata -> Cmd msg
