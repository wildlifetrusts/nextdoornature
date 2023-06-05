module Message exposing (Msg(..))

import Browser
import Http
import Page.Shared.Data
import Url


type Msg
    = UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest
    | LanguageChangeRequested
    | CookieSettingsButtonClicked
    | CookiesAccepted
    | CookiesDeclined
    | SearchChanged (List Page.Shared.Data.GuideTeaser) String
      -- | SearchChanged (List Page.Shared.Data.GuideTeaser)
    | GotActions (Result Http.Error (List Page.Shared.Data.GuideTeaser))
