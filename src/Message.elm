module Message exposing (Msg(..))

import Browser
import Http
import Page.Shared exposing (GuideTeaser)
import Url


type Msg
    = UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest
    | LanguageChangeRequested
    | CookieSettingsButtonClicked
    | CookiesAccepted
    | CookiesDeclined
    | GotActions (Result Http.Error (List GuideTeaser))
