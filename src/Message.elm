module Message exposing (Msg(..))

import Browser
import Http
import Page.Shared.Data
import Random
import Shared
import Url


type Msg
    = UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest
    | LanguageChangeRequested
    | CookieSettingsButtonClicked
    | CookiesAccepted
    | CookiesDeclined
    | SearchChanged Shared.SearchData String
    | GotActions (Result Http.Error (List Page.Shared.Data.Teaser))
    | UpdateSeed Random.Seed
    | Print
    | NoOp
