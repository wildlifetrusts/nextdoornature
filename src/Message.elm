module Message exposing (Msg(..))

-- import Http
-- import Shared exposing (GuideTeaser)

import Browser
import Url


type Msg
    = UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest
    | LanguageChangeRequested
    | CookieSettingsButtonClicked
    | CookiesAccepted
    | CookiesDeclined



-- | GotActions (Result Http.Error (List GuideTeaser))
