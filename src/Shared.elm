module Shared exposing (Content, CookieState, Model, Request(..), contentDictDecoder)

import Browser.Navigation
import Dict exposing (Dict)
import I18n.Translate exposing (Language)
import Json.Decode
import Page.Data
import Page.Guide.Data
import Page.Shared.Data
import Page.Story.Data
import Route exposing (Route)


type alias Model =
    { key : Browser.Navigation.Key
    , page : Route
    , cookieState : CookieState
    , language : Language
    , content : Content
    , search : List Page.Shared.Data.Teaser
    , query : String
    , externalActions : Request
    }


type alias CookieState =
    { enableAnalytics : Bool
    , cookieBannerIsOpen : Bool
    }


type alias Content =
    { guides :
        { cy : Dict String Page.Guide.Data.Guide
        , en : Dict String Page.Guide.Data.Guide
        }
    , pages :
        { cy : Dict String Page.Data.Page
        , en : Dict String Page.Data.Page
        }
    , stories :
        { cy : Dict String Page.Story.Data.Story
        , en : Dict String Page.Story.Data.Story
        }
    }


type Request
    = Failure
    | Loading
    | Success (List Page.Shared.Data.Teaser)


contentDictDecoder : Json.Decode.Value -> Content
contentDictDecoder flags =
    case Json.Decode.decodeValue flagsDictDecoder flags of
        Ok goodContent ->
            goodContent

        Err _ ->
            --let
            --    e =
            --        Debug.log "Flag decode ERROR" error
            --in
            { guides = { cy = Dict.empty, en = Dict.empty }
            , pages = { cy = Dict.empty, en = Dict.empty }
            , stories = { cy = Dict.empty, en = Dict.empty }
            }


flagsDictDecoder : Json.Decode.Decoder Content
flagsDictDecoder =
    Json.Decode.map3 Content
        (Json.Decode.field "guides" Page.Guide.Data.guideLanguageDictDecoder)
        (Json.Decode.field "pages" Page.Data.pageLanguageDictDecoder)
        (Json.Decode.field "stories" Page.Story.Data.storyLanguageDictDecoder)
