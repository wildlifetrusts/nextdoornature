module Shared exposing (Content, CookieState, Model, Request(..), SearchData, Searchable(..), contentDictDecoder, searchableToString, shuffleList)

import Array
import Browser.Navigation
import Dict exposing (Dict)
import I18n.Translate exposing (Language)
import Json.Decode
import Page.Data
import Page.Guide.Data
import Page.Shared.Data
import Page.Story.Data
import Random
import Route exposing (Route)


type alias Model =
    { key : Browser.Navigation.Key
    , page : Route
    , cookieState : CookieState
    , language : Language
    , content : Content
    , searchResult : SearchData
    , query : String
    , externalActions : Request
    , seed : Maybe Random.Seed
    }


type Searchable
    = Action
    | Guide
    | Story


searchableToString : Searchable -> String
searchableToString itemType =
    case itemType of
        Action ->
            "action"

        Guide ->
            "guide"

        Story ->
            "story"


type alias SearchData =
    { actions : List Page.Shared.Data.Teaser
    , guides : List Page.Shared.Data.Teaser
    , stories : List Page.Shared.Data.Teaser
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
            --       Debug.log "Flag decode ERROR" error
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


shuffleList : Maybe Random.Seed -> List a -> List a
shuffleList seed list =
    case seed of
        Just aSeed ->
            shuffleListHelper aSeed list []

        Nothing ->
            []


shuffleListHelper : Random.Seed -> List a -> List a -> List a
shuffleListHelper seed source result =
    if List.isEmpty source then
        result

    else
        let
            indexGenerator : Random.Generator Int
            indexGenerator =
                Random.int 0 (List.length source - 1)

            ( index, nextSeed ) =
                Random.step indexGenerator seed

            valAtIndex : Maybe a
            valAtIndex =
                Array.get index (Array.fromList source)
        in
        case valAtIndex of
            Just val ->
                let
                    sourceWithoutIndex : List a
                    sourceWithoutIndex =
                        List.take index source ++ List.drop (index + 1) source
                in
                shuffleListHelper nextSeed sourceWithoutIndex (val :: result)

            Nothing ->
                result
