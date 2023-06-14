port module Metadata exposing (PageMetadata, metadataFromPage, setMetadata)

import Dict
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, dictFromLanguage, translate)
import Page.Data
import Page.Guide.Data
import Page.Story.Data
import Route exposing (Route(..))
import Shared exposing (Content)


type alias PageMetadata =
    { title : String
    , description : String
    , imageSrc : String
    , summary : String
    , maybeAuthor : Maybe String
    }


defaultMetaImageSrc : String
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
    , summary = ""
    , maybeAuthor = Nothing
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
            , summary = ""
            , maybeAuthor = Nothing
            }

        Guide slug ->
            case guideMetadataFromSlug slug (dictFromLanguage language content.guides) of
                Just metadata ->
                    { metadata | title = subPageTitle language metadata.title }

                Nothing ->
                    defaultMetadata language

        Guides ->
            { title = subPageTitle language (t GuidesTitle)
            , description = t GuidesMetaDescription
            , imageSrc = defaultMetaImageSrc
            , summary = ""
            , maybeAuthor = Nothing
            }

        Story slug ->
            case storyMetadataFromSlug slug (dictFromLanguage language content.stories) of
                Just metadata ->
                    { metadata
                        | title = subPageTitle language metadata.title
                        , description = storyDescription language metadata.summary metadata.maybeAuthor metadata.title
                    }

                Nothing ->
                    defaultMetadata language

        Page slug ->
            case pageMetadataFromSlug slug (dictFromLanguage language content.pages) of
                Just metadata ->
                    { metadata | title = subPageTitle language metadata.title }

                Nothing ->
                    defaultMetadata language


guideMetadataFromSlug :
    String
    -> Dict.Dict String Page.Guide.Data.Guide
    -> Maybe PageMetadata
guideMetadataFromSlug slug contentDict =
    case Dict.get slug contentDict of
        Just content ->
            Just
                { title = content.title
                , description = content.summary
                , imageSrc = imageSrcFromMaybeImage content.maybeImage
                , summary = ""
                , maybeAuthor = Nothing
                }

        Nothing ->
            Nothing


storyMetadataFromSlug :
    String
    -> Dict.Dict String Page.Story.Data.Story
    -> Maybe PageMetadata
storyMetadataFromSlug slug contentDict =
    case Dict.get slug contentDict of
        Just content ->
            Just
                { title = content.title
                , description = content.summary
                , imageSrc = imageSrcFromList content.images
                , summary = content.summary
                , maybeAuthor = content.maybeGroupOrIndividual
                }

        Nothing ->
            Nothing


pageMetadataFromSlug :
    String
    -> Dict.Dict String Page.Data.Page
    -> Maybe PageMetadata
pageMetadataFromSlug slug contentDict =
    case Dict.get slug contentDict of
        Just content ->
            Just
                { title = content.title
                , description = descriptionFromBody content.fullTextMarkdown
                , imageSrc = defaultMetaImageSrc
                , summary = ""
                , maybeAuthor = Nothing
                }

        Nothing ->
            Nothing


descriptionFromBody : String -> String
descriptionFromBody bodyMarkdown =
    -- Grab everything up to the first fullstop.
    (String.split "." bodyMarkdown
        |> List.head
        |> Maybe.withDefault ""
    )
        ++ "."


storyDescription : Language -> String -> Maybe String -> String -> String
storyDescription language summary maybeAuthor title =
    if String.length summary > 0 then
        summary

    else
        let
            author =
                Maybe.withDefault "" maybeAuthor
        in
        if String.length author > 0 then
            translate language (StoryMetaDescriptionWithAuthor author title)

        else
            translate language (StoryMetaDescription title)


imageSrcFromList : List { a | src : String } -> String
imageSrcFromList imageList =
    imageSrcFromMaybeImage (List.head imageList)


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
