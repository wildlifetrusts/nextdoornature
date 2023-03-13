module Page.Guide.Data exposing (Guide, guideFromSlug)

import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Page.Shared


type alias Guide =
    { title : String
    , fullTextMarkdown : String
    , maybeVideo : Maybe Page.Shared.VideoMeta
    , maybeAudio : Maybe Page.Shared.AudioMeta
    , relatedStoryList : List Page.Shared.StoryTeaser
    , relateGuideList : List Page.Shared.GuideTeaser
    }


blankGuide : Language -> Guide
blankGuide language =
    let
        t : Key -> String
        t =
            translate language
    in
    { title = t Guide404Title
    , fullTextMarkdown = t Guide404Body
    , maybeVideo = Nothing
    , maybeAudio = Nothing
    , relatedStoryList = []
    , relateGuideList = []
    }


guideFromSlug : Language -> String -> Guide
guideFromSlug language slug =
    -- TODO populate from markdown
    blankGuide language
