module Page.Guide.Data exposing (Guide, guideDictDecoder, guideFromSlug)

import Dict exposing (Dict)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Json.Decode
import Json.Decode.Extra
import Page.Shared.View


type alias Guide =
    { title : String
    , slug : String
    , fullTextMarkdown : String
    , maybeVideo : Maybe Page.Shared.View.VideoMeta
    , maybeAudio : Maybe Page.Shared.View.AudioMeta
    , relatedStoryList : List Page.Shared.View.StoryTeaser
    , relateGuideList : List Page.Shared.View.GuideTeaser
    }


blankGuide : Language -> Guide
blankGuide language =
    let
        t : Key -> String
        t =
            translate language
    in
    { title = t Guide404Title
    , slug = t Guide404Slug
    , fullTextMarkdown = t Guide404Body
    , maybeVideo = Nothing
    , maybeAudio = Nothing
    , relatedStoryList = []
    , relateGuideList = []
    }


guideDictDecoder : Json.Decode.Decoder (Dict String Guide)
guideDictDecoder =
    Json.Decode.dict
        (Json.Decode.succeed Guide
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "title" Json.Decode.string |> Json.Decode.Extra.withDefault "")
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "basename" Json.Decode.string |> Json.Decode.Extra.withDefault "")
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "content" Json.Decode.string |> Json.Decode.Extra.withDefault "")
            |> Json.Decode.Extra.andMap
                (Json.Decode.maybe (Json.Decode.field "maybeVideo" Page.Shared.View.videoDecoder))
            |> Json.Decode.Extra.andMap
                (Json.Decode.maybe (Json.Decode.field "maybeAudio" Page.Shared.View.audioDecoder))
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "relatedStoryList"
                    (Json.Decode.list Page.Shared.View.storyTeaserDecoder)
                    |> Json.Decode.Extra.withDefault []
                )
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "relatedGuideList"
                    (Json.Decode.list Page.Shared.View.guideTeaserDecoder)
                    |> Json.Decode.Extra.withDefault []
                )
        )


guideFromSlug : Language -> String -> Guide
guideFromSlug language slug =
    -- TODO populate from markdown
    blankGuide language
