module Page.Stories.Data exposing (Story, storyFromSlug)

import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Page.Shared


type alias Story =
    { title : String
    , fullTextMarkdown : String
    , relatedStoryList : List Page.Shared.StoryTeaser
    , relatedResourceList : List Page.Shared.ResourceTeaser
    }


blankStory : Language -> Story
blankStory language =
    let
        t : Key -> String
        t =
            translate language
    in
    { title = t Story404Title
    , fullTextMarkdown = t Story404Body
    , relatedStoryList = []
    , relatedResourceList = []
    }


storyFromSlug : Language -> String -> Story
storyFromSlug language slug =
    -- TODO populate from markdown
    blankStory language
