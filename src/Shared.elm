module Shared exposing (Content, CookieState, Model, Request(..))

import Browser.Navigation
import Dict exposing (Dict)
import I18n.Translate exposing (Language)
import Page.Data
import Page.Guide.Data
import Page.GuideTeaser
import Page.Story.Data
import Route exposing (Route)


type alias Model =
    { key : Browser.Navigation.Key
    , page : Route
    , cookieState : CookieState
    , language : Language
    , content : Content
    , search : List Page.GuideTeaser.GuideTeaser
    , externalActions : Request
    }


type alias CookieState =
    { enableAnalytics : Bool
    , cookieBannerIsOpen : Bool
    }


type alias Content =
    { guides :
        { cy : Dict String Page.Guide.Data.Guide
        , en : Dict String Page.Guide.Data.Guide
        }
    , pages :
        { cy : Dict String Page.Data.Page
        , en : Dict String Page.Data.Page
        }
    , stories : Dict String Page.Story.Data.Story
    }


type Request
    = Failure
    | Loading
    | Success (List Page.GuideTeaser.GuideTeaser)
