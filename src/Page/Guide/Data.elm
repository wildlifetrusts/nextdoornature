module Page.Guide.Data exposing (Guide, GuideListItem, Guides, Image, allGuidesSlugTitleList, defaultGuideImage, guideFromSlug, guideLanguageDictDecoder, guidesInPreferredLanguage)

import Dict exposing (Dict)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..))
import Json.Decode
import Json.Decode.Extra
import Page.Shared.Data


type alias Guides =
    { cy : Dict String Guide
    , en : Dict String Guide
    }


type alias Guide =
    { title : String
    , slug : String
    , fullTextMarkdown : String
    , summary : String
    , maybeImage : Maybe Image
    , maybeVideo : Maybe Page.Shared.Data.VideoMeta
    , maybeAudio : Maybe Page.Shared.Data.AudioMeta
    , relatedStoryList : List String
    , relatedGuideList : List String
    , categorySlug : String
    }


type alias Image =
    { src : String
    , alt : String
    , maybeCredit : Maybe String
    }


defaultGuideImage : Image
defaultGuideImage =
    { src = "/images/default-guide-image.jpg"
    , alt = ""
    , maybeCredit = Nothing
    }


type alias GuideListItem =
    { slug : String
    , titleKey : String
    , en : { title : String }
    , cy : { title : String }
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
                (Json.Decode.field "summary" Json.Decode.string |> Json.Decode.Extra.withDefault "")
            |> Json.Decode.Extra.andMap
                (Json.Decode.maybe (Json.Decode.field "image" imageDecoder))
            |> Json.Decode.Extra.andMap
                (Json.Decode.maybe (Json.Decode.field "video" Page.Shared.Data.videoDecoder))
            |> Json.Decode.Extra.andMap
                (Json.Decode.maybe (Json.Decode.field "audio" Page.Shared.Data.audioDecoder))
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "relatedStories"
                    (Json.Decode.list Json.Decode.string)
                    |> Json.Decode.Extra.withDefault []
                )
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "relatedGuides"
                    (Json.Decode.list Json.Decode.string)
                    |> Json.Decode.Extra.withDefault []
                )
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "category" Json.Decode.string |> Json.Decode.Extra.withDefault "")
        )


imageDecoder : Json.Decode.Decoder Image
imageDecoder =
    Json.Decode.map3 Image
        (Json.Decode.field "src" Json.Decode.string)
        (Json.Decode.field "alt" Json.Decode.string)
        (Json.Decode.maybe (Json.Decode.field "credit" Json.Decode.string))


guideLanguageDictDecoder : Json.Decode.Decoder Guides
guideLanguageDictDecoder =
    Json.Decode.map2 Guides
        (Json.Decode.field "cy" guideDictDecoder)
        (Json.Decode.field "en" guideDictDecoder)


guidesInPreferredLanguage : Language -> Guides -> Dict String Guide
guidesInPreferredLanguage language guides =
    case language of
        English ->
            guides.en

        Welsh ->
            guides.cy


fallbackGuides : Language -> Guides -> Dict String Guide
fallbackGuides language guides =
    case language of
        English ->
            guides.cy

        Welsh ->
            guides.en


guideFromSlug : Language -> Guides -> String -> Maybe Guide
guideFromSlug language guides slug =
    case Dict.get slug (guidesInPreferredLanguage language guides) of
        Just aGuide ->
            Just aGuide

        Nothing ->
            Dict.get slug (fallbackGuides language guides)


allGuidesSlugTitleList : Guides -> List GuideListItem
allGuidesSlugTitleList guides =
    -- merge on slug keys keeping en data
    Dict.union guides.en guides.cy
        |> Dict.toList
        |> List.map
            (\( _, guide ) ->
                { slug = guide.slug
                , titleKey = guide.title
                , en =
                    { title = titleFromSlug guides.en guide }
                , cy =
                    { title = titleFromSlug guides.cy guide
                    }
                }
            )


titleFromSlug : Dict String Guide -> Guide -> String
titleFromSlug guideDict { slug, title } =
    case Dict.get slug guideDict of
        Just aGuide ->
            aGuide.title

        -- If we don't find a match on the slug,
        -- go with the title of guide we passed in.
        -- Means guide only exists in one language.
        Nothing ->
            title
