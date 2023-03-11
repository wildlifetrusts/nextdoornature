module Page.Resource.Data exposing (Resource, resourceFromSlug)

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


blankResource : Resource
blankResource =
    { title = "[fFf]  Dummy Resource Title"
    , fullTextMarkdown = "[fFf] Blank Resource Markdown"
    , maybeVideo = Nothing
    , maybeAudio = Nothing
    , relatedCaseStudyList = []
    , relatedResourceList = []
    }


resourceFromSlug : String -> Resource
resourceFromSlug slug =
    -- TODO populate from markdown
    blankResource
