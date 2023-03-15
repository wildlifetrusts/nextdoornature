module Page.Guide.Data exposing (Guide, guideDictDecoder, guideFromSlug, teaserListFromGuideDict)

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
    , summary : String
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
    , summary = t Guide404Title
    , maybeVideo = Nothing
    , maybeAudio = Nothing
    , relatedStoryList =
        --- [fFf] to be replaced
        [ { title = "Test story teaser", slug = "test-story", image = { src = "/images/wildlife-trust-logo.png", alt = "placeholder" }, description = "A test description" }
        , { title = "Test story teaser", slug = "test-story", image = { src = "/images/wildlife-trust-logo.png", alt = "placeholder" }, description = "A test description" }
        , { title = "Test story teaser", slug = "test-story", image = { src = "/images/wildlife-trust-logo.png", alt = "placeholder" }, description = "A test description" }
        , { title = "Test story teaser", slug = "test-story", image = { src = "/images/wildlife-trust-logo.png", alt = "placeholder" }, description = "A test description" }
        ]
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
                (Json.Decode.field "summary" Json.Decode.string |> Json.Decode.Extra.withDefault "")
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


guideFromSlug : Language -> Dict String Guide -> String -> Guide
guideFromSlug language guides slug =
    case Dict.get slug guides of
        Just aGuide ->
            aGuide

        Nothing ->
            blankGuide language


slugToUrl : String -> String
slugToUrl slug =
    "/guides/" ++ slug


teaserListFromGuideDict :
    Language
    -> Dict String Guide
    -> List Page.Shared.View.GuideTeaser
teaserListFromGuideDict language guides =
    Dict.toList guides
        |> List.map
            (\( _, guide ) ->
                { title = guide.title
                , url = slugToUrl guide.slug
                , summary = guide.summary
                }
            )
