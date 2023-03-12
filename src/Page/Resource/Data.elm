module Page.Resource.Data exposing (Resource, resourceFromSlug)

import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Page.Shared
import Url


type alias Resource =
    { title : String
    , fullTextMarkdown : String
    , maybeVideo : Maybe Page.Shared.VideoMeta
    , maybeAudio : Maybe Page.Shared.AudioMeta
    , relatedCaseStudyList : List Page.Shared.CaseStudyTeaser
    , relatedResourceList : List Page.Shared.ResourceTeaser
    }


blankResource : Language -> Resource
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
    , relatedCaseStudyList = []
    , relatedResourceList = []
    }


resourceFromSlug : Language -> String -> Resource
resourceFromSlug language slug =
    -- TODO populate from markdown
    blankResource language
