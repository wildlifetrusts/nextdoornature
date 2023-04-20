module Message exposing (Msg(..))

import Browser
import Http
import Page.GuideTeaser
import Url


type Msg
    = UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest
    | LanguageChangeRequested
    | CookieSettingsButtonClicked
    | CookiesAccepted
    | CookiesDeclined
    | GotActions (Result Http.Error (List Page.GuideTeaser.GuideTeaser))
