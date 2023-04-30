module Page.Story.Data exposing (Stories, Story, storyFromSlug, storyLanguageDictDecoder)

import Dict exposing (Dict)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Json.Decode
import Json.Decode.Extra
import Page.GuideTeaser
import Page.Shared.View


type alias Stories =
    { cy : Dict String Story
    , en : Dict String Story
    }


type alias Story =
    { title : String
    , slug : String
    , maybeLocation : Maybe String
    , maybeGroupOrIndividual : Maybe String
    , maybeImages : Maybe (List Page.GuideTeaser.Image)
    , fullTextMarkdown : String
    , relatedGuideList : List Page.GuideTeaser.GuideTeaser
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
    , maybeLocation = Nothing
    , maybeGroupOrIndividual = Nothing
    , maybeImages = Nothing
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
                (Json.Decode.maybe (Json.Decode.field "location" Json.Decode.string |> Json.Decode.Extra.withDefault ""))
            |> Json.Decode.Extra.andMap
                (Json.Decode.maybe (Json.Decode.field "groupOrIndividual" Json.Decode.string |> Json.Decode.Extra.withDefault ""))
            |> Json.Decode.Extra.andMap
                (Json.Decode.maybe (Json.Decode.field "images" (Json.Decode.list Page.Shared.View.imageDecoder)))
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "content" Json.Decode.string |> Json.Decode.Extra.withDefault "")
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "relatedGuideList"
                    (Json.Decode.list Page.Shared.View.guideTeaserDecoder)
                    |> Json.Decode.Extra.withDefault []
                )
        )


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


storyFromSlug : Language -> Stories -> String -> Story
storyFromSlug language stories slug =
    case Dict.get slug (storiesInPreferredLanguage language stories) of
        Just aStory ->
            aStory

        Nothing ->
            blankStory language
