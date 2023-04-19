module Page.Story.Data exposing (Story, storyDictDecoder, storyFromSlug)

import Dict exposing (Dict)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Json.Decode
import Json.Decode.Extra
import Page.Shared exposing (GuideTeaser, Image)
import Page.Shared.View


type alias Story =
    { title : String
    , slug : String
    , maybeLocation : Maybe String
    , maybeGroupOrIndividual : Maybe String
    , maybeImages : Maybe (List Image)
    , fullTextMarkdown : String
    , relatedGuideList : List GuideTeaser
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


storyFromSlug : Language -> Dict String Story -> String -> Story
storyFromSlug language stories slug =
    case Dict.get slug stories of
        Just aStory ->
            aStory

        Nothing ->
            blankStory language
