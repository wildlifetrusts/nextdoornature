module Page.Stories.Data exposing (Story, storyDictDecoder, storyFromSlug)

import Dict exposing (Dict)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Json.Decode exposing (Decoder)
import Json.Decode.Extra
import Page.Shared.View


type alias Story =
    { title : String
    , slug : String
    , fullTextMarkdown : String
    , maybeMetadata : Maybe StoryMetaData
    , relatedGuideList : List Page.Shared.View.GuideTeaser
    }


type alias StoryMetaData =
    { location : String
    , author : String
    , images : List Page.Shared.View.Image
    }


blankStory : Language -> Story
blankStory language =
    let
        t : Key -> String
        t =
            translate language
    in
    { title = t Story404Title
    , slug = ""
    , fullTextMarkdown = t Story404Body
    , maybeMetadata = Nothing
    , relatedGuideList = []
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
                (Json.Decode.field "content" Json.Decode.string |> Json.Decode.Extra.withDefault "")
            |> Json.Decode.Extra.andMap
                (Json.Decode.maybe (Json.Decode.field "maybeMetadata" maybeMetadataDecoder))
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "relatedGuideList"
                    (Json.Decode.list Page.Shared.View.guideTeaserDecoder)
                    |> Json.Decode.Extra.withDefault []
                )
        )


maybeMetadataDecoder : Decoder StoryMetaData
maybeMetadataDecoder =
    Json.Decode.map3 StoryMetaData
        (Json.Decode.field "location" Json.Decode.string)
        (Json.Decode.field "author" Json.Decode.string)
        (Json.Decode.field "images"
            (Json.Decode.list Page.Shared.View.imageDecoder)
        )


storyFromSlug : Language -> Dict String Story -> String -> Story
storyFromSlug language stories slug =
    case Dict.get slug stories of
        Just aStory ->
            aStory

        Nothing ->
            blankStory language
