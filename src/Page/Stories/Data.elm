module Page.Stories.Data exposing (Story, storyFromSlug)

import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Page.Shared


type alias Story =
    { title : String
    , description : String
    , maybeMetadata : Maybe StoryMetaData
    , relatedStoryList : List Page.Shared.StoryTeaser
    , relatedResourceList : List Page.Shared.ResourceTeaser
    }


type alias StoryMetaData =
    { location : String
    , author : String
    , images : List { src : String, alt : String }
    }


blankStory : Language -> Story
blankStory language =
    let
        t : Key -> String
        t =
            translate language
    in
    { title = t Story404Title
    , description = t Story404Body
    , maybeMetadata = Nothing
    , relatedStoryList = []
    , relatedResourceList = []
    }


testStory : Story
testStory =
    { title = "A test story"
    , description = "Test description"
    , maybeMetadata =
        Just
            { location = "Test location"
            , author = "Test author"
            , images = [ { src = "/images/wildlife-trust-logo.png", alt = "placeholder" } ]
            }
    , relatedStoryList = []
    , relatedResourceList = []
    }


storyFromSlug : Language -> String -> Story
storyFromSlug language slug =
    -- TODO populate from markdown
    testStory
