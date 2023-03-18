module Page.Shared.Data exposing (Content, contentDictDecoder)

import Dict exposing (Dict)
import Json.Decode
import Page.Guide.Data
import Page.Story.Data


type alias Content =
    { guides : Dict String Page.Guide.Data.Guide
    , stories : Dict String Page.Story.Data.Story
    }


contentDictDecoder : Json.Decode.Value -> Content
contentDictDecoder flags =
    case Json.Decode.decodeValue flagsDictDecoder flags of
        Ok goodContent ->
            goodContent

        Err _ ->
            { guides = Dict.empty, stories = Dict.empty }


flagsDictDecoder : Json.Decode.Decoder Content
flagsDictDecoder =
    Json.Decode.map2 Content
        (Json.Decode.field "guides" Page.Guide.Data.guideDictDecoder)
        (Json.Decode.field "stories" Page.Story.Data.storyDictDecoder)
