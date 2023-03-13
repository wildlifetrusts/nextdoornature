module Shared exposing (Model, Msg(..))

import Browser
import Browser.Navigation
import I18n.Translate exposing (Language)
import Page.Shared.Data
import Route exposing (Route)
import Url


type alias Model =
    { key : Browser.Navigation.Key
    , page : Route
    , language : Language
    , content : Pages.Shared.Data.Content
    }


type Msg
    = UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest
    | LanguageChangeRequested
