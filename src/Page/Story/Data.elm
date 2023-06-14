module Page.Story.Data exposing (Image, Stories, Story, StoryTeaser, allStoryTeaserList, defaultStoryImageSrc, storiesInPreferredLanguage, storyFromSlug, storyLanguageDictDecoder)

import Dict exposing (Dict)
import I18n.Translate exposing (Language(..))
import Json.Decode
import Json.Decode.Extra


type alias Stories =
    { cy : Dict String Story
    , en : Dict String Story
    }


type alias Story =
    { title : String
    , slug : String
    , maybeLocation : Maybe String
    , maybeGroupOrIndividual : Maybe String
    , images : List Image
    , maybePullQuote : Maybe String
    , fullTextMarkdown : String
    }


type alias Image =
    { alt : String
    , src : String
    , maybeCaption : Maybe String
    , maybeCredit : Maybe String
    }


defaultStoryImageSrc : String
defaultStoryImageSrc =
    "/images/default-story-image.jpg"


type alias StoryTeaser =
    { titleKey : String
    , slug : String
    , en : { title : String, maybeImage : Maybe Image }
    , cy : { title : String, maybeImage : Maybe Image }
    }


storyDictDecoder : Json.Decode.Decoder (Dict String Story)
storyDictDecoder =
    Json.Decode.dict
        (Json.Decode.succeed Story
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "title" Json.Decode.string |> Json.Decode.Extra.withDefault "")
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "basename" Json.Decode.string |> Json.Decode.Extra.withDefault "")
            |> Json.Decode.Extra.andMap
                (Json.Decode.maybe (Json.Decode.field "location" Json.Decode.string |> Json.Decode.Extra.withDefault ""))
            |> Json.Decode.Extra.andMap
                (Json.Decode.maybe (Json.Decode.field "who" Json.Decode.string |> Json.Decode.Extra.withDefault ""))
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "images" (Json.Decode.list imageDecoder))
            |> Json.Decode.Extra.andMap
                (Json.Decode.maybe (Json.Decode.field "pullQuote" Json.Decode.string |> Json.Decode.Extra.withDefault ""))
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "content" Json.Decode.string |> Json.Decode.Extra.withDefault "")
        )


imageDecoder : Json.Decode.Decoder Image
imageDecoder =
    Json.Decode.map4 Image
        (Json.Decode.field "alt" Json.Decode.string)
        (Json.Decode.field "src" Json.Decode.string)
        (Json.Decode.maybe (Json.Decode.field "caption" Json.Decode.string))
        (Json.Decode.maybe (Json.Decode.field "credit" Json.Decode.string))


storyLanguageDictDecoder : Json.Decode.Decoder Stories
storyLanguageDictDecoder =
    Json.Decode.map2 Stories
        (Json.Decode.field "cy" storyDictDecoder)
        (Json.Decode.field "en" storyDictDecoder)


storiesInPreferredLanguage : Language -> Stories -> Dict String Story
storiesInPreferredLanguage language stories =
    case language of
        English ->
            stories.en

        Welsh ->
            stories.cy


fallbackStories : Language -> Stories -> Dict String Story
fallbackStories language stories =
    case language of
        English ->
            stories.cy

        Welsh ->
            stories.en


storyFromSlug : Language -> Stories -> String -> Maybe Story
storyFromSlug language stories slug =
    case Dict.get slug (storiesInPreferredLanguage language stories) of
        Just aStory ->
            Just aStory

        Nothing ->
            Dict.get slug (fallbackStories language stories)


allStoryTeaserList : Stories -> List StoryTeaser
allStoryTeaserList stories =
    -- merge on slug keys, keeping en data
    Dict.union stories.en stories.cy
        |> Dict.toList
        |> List.map
            (\( _, story ) ->
                { slug = story.slug
                , titleKey = story.title
                , en = translationsFromSlug stories.en story
                , cy = translationsFromSlug stories.cy story
                }
            )


translationsFromSlug : Dict String Story -> Story -> { title : String, maybeImage : Maybe Image }
translationsFromSlug storyDict { slug, title, images } =
    case Dict.get slug storyDict of
        Just aStory ->
            { title = aStory.title
            , maybeImage =
                -- If there are no images, check the story we passed in.
                -- Maybe images only exist in one language.
                if List.length aStory.images > 0 then
                    List.head aStory.images

                else
                    List.head images
            }

        -- If we don't have a story with this slug,
        -- fall back to the one we passed in.
        -- Means this story is only on one language.
        Nothing ->
            { title = title, maybeImage = List.head images }
