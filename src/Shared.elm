module Shared exposing (Model, Msg(..))

import Browser
import Browser.Navigation
import I18n.Translate exposing (Language)
import Route exposing (Route)
import Url


type alias Model =
    { key : Browser.Navigation.Key
    , page : Route
    , language : Language
    }


type Msg
    = UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest
    | LanguageChangeRequested
