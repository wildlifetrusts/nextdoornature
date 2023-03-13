module Page.Stories.Data exposing (Story, storyFromSlug)

import Dict
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Page.Shared


type alias Story =
    { title : String
    , description : String
    , maybeMetadata : Maybe StoryMetaData
    , relatedStoryList : List Page.Shared.StoryTeaser
    , relatedGuideList : List Page.Shared.GuideTeaser
    }


type alias StoryMetaData =
    { location : String
    , author : String
    , images : List { src : String, alt : String }
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
    , relatedGuideList = []
    }


storyTable : Dict.Dict String Story
storyTable =
    Dict.fromList
        [ ( "alpha", testStory )
        , ( "beta", Story "beta title" "alpha description" Nothing [] [] )
        , ( "cappa", Story "cappa title" "alpha description" Nothing [] [] )
        ]


missingStory : Language -> Story
missingStory language =
    let
        t : Key -> String
        t =
            translate language
    in
    { title = t Story404Title
    , description = t Story404Body
    , maybeMetadata = Nothing
    , relatedStoryList = []
    , relatedGuideList = []
    }


storyFromSlug : Language -> String -> Story
storyFromSlug language slug =
    -- TODO populate from markdown
    Maybe.withDefault
        (missingStory language)
        (Dict.get slug storyTable)



