module Shared exposing (Content, Model)

import Browser.Navigation
import Dict exposing (Dict)
import I18n.Translate exposing (Language)
import Page.Guide.Data
import Route exposing (Route)


type alias Model =
    { key : Browser.Navigation.Key
    , page : Route
    , language : Language
    , content : Content
    }


type alias Content =
    { guides : Dict String Page.Guide.Data.Guide }
