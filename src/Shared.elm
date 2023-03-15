module Shared exposing (Content, CookieState, Model)

import Browser.Navigation
import Dict exposing (Dict)
import I18n.Translate exposing (Language)
import Page.Guide.Data
import Page.Stories.Data
import Route exposing (Route)


type alias Model =
    { key : Browser.Navigation.Key
    , page : Route
    , cookieState : CookieState
    , language : Language
    , content : Content
    }


type alias CookieState =
    { enableAnalytics : Bool
    , cookieBannerIsOpen : Bool
    }


type alias Content =
    { guides : Dict String Page.Guide.Data.Guide
    , stories : Dict String Page.Stories.Data.Story
    }
