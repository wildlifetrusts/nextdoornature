module Shared exposing (Content, CookieState, GuideTeaser, Image, Model, Request(..))

import Browser.Navigation
import Dict exposing (Dict)
import I18n.Translate exposing (Language)
import Page.Data
import Page.Guide.Data
import Page.Story.Data
import Route exposing (Route)


type alias Model =
    { key : Browser.Navigation.Key
    , page : Route
    , cookieState : CookieState
    , language : Language
    , content : Content
    , externalActions : Request
    }


type alias CookieState =
    { enableAnalytics : Bool
    , cookieBannerIsOpen : Bool
    }


type alias Content =
    { guides : Dict String Page.Guide.Data.Guide
    , stories : Dict String Page.Story.Data.Story
    , pages : Dict String Page.Data.Page
    }


type Request
    = Failure
    | Loading
    | Success (List GuideTeaser)


type alias Image =
    { src : String, alt : String }


type alias GuideTeaser =
    { title : String

    -- This will maybe turn into Url.Url when we include external resources
    , url : String
    , summary : String
    , maybeImage : Maybe Image
    }
