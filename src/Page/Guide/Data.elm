module Page.Guide.Data exposing (Guide, resourceFromSlug)

import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Page.Shared


type alias Guide =
    { title : String
    , fullTextMarkdown : String
    , maybeVideo : Maybe Page.Shared.VideoMeta
    , maybeAudio : Maybe Page.Shared.AudioMeta
    , relatedStoryList : List Page.Shared.StoryTeaser
    , relatedResourceList : List Page.Shared.ResourceTeaser
    }


blankResource : Language -> Guide
blankResource language =
    let
        t : Key -> String
        t =
            translate language
    in
    { title = t Resource404Title
    , fullTextMarkdown = t Resource404Body
    , maybeVideo = Nothing
    , maybeAudio = Nothing
    , relatedStoryList = []
    , relatedResourceList = []
    }


resourceFromSlug : Language -> String -> Guide
resourceFromSlug language slug =
    -- TODO populate from markdown
    blankResource language
