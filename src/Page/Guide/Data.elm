module Page.Guide.Data exposing (Guide, GuideListItem, Guides, allGuidesSlugTitleList, guideFromSlug, guideLanguageDictDecoder, teaserListFromGuideDict)

import Dict exposing (Dict)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Json.Decode
import Json.Decode.Extra
import Page.GuideTeaser
import Page.Shared.View
import Route


type alias Guides =
    { cy : Dict String Guide
    , en : Dict String Guide
    }


type alias Guide =
    { title : String
    , slug : String
    , fullTextMarkdown : String
    , summary : String
    , maybeImage : Maybe Page.GuideTeaser.Image
    , maybeVideo : Maybe Page.Shared.View.VideoMeta
    , maybeAudio : Maybe Page.Shared.View.AudioMeta
    , relatedStoryList : List String
    , relatedGuideList : List String
    }


type alias GuideListItem =
    { slug : String
    , titleKey : String
    , en : { title : String }
    , cy : { title : String }
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
    , summary = t Guide404Title
    , maybeImage = Nothing
    , maybeVideo = Nothing
    , maybeAudio = Nothing
    , relatedStoryList = []
    , relatedGuideList = []
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
                (Json.Decode.maybe (Json.Decode.field "image" Page.Shared.View.imageDecoder))
            |> Json.Decode.Extra.andMap
                (Json.Decode.maybe (Json.Decode.field "video" Page.Shared.View.videoDecoder))
            |> Json.Decode.Extra.andMap
                (Json.Decode.maybe (Json.Decode.field "audio" Page.Shared.View.audioDecoder))
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
        )


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


guideFromSlug : Language -> Guides -> String -> Guide
guideFromSlug language guides slug =
    case Dict.get slug (guidesInPreferredLanguage language guides) of
        Just aGuide ->
            aGuide

        Nothing ->
            case Dict.get slug (fallbackGuides language guides) of
                Just aGuide ->
                    aGuide

                Nothing ->
                    blankGuide language


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


teaserListFromGuideDict :
    Language
    -> Guides
    -> List Page.GuideTeaser.GuideTeaser
teaserListFromGuideDict language guides =
    Dict.toList (guidesInPreferredLanguage language guides)
        |> List.map
            (\( _, g ) ->
                { title = g.title
                , url = Route.toString (Route.Guide g.slug)
                , summary = g.summary
                , maybeImage = g.maybeImage
                }
            )
