module Page.Shared.Data exposing (Content, contentDictDecoder)

import Dict exposing (Dict)
import Json.Decode
import Page.Guide.Data


type alias Content =
    { guides : Dict String Page.Guide.Data.Guide }


contentDictDecoder : Json.Decode.Value -> Content
contentDictDecoder flags =
    case Json.Decode.decodeValue flagsDictDecoder flags of
        Ok goodContent ->
            goodContent

        Err _ ->
            { guides = Dict.empty }


flagsDictDecoder : Json.Decode.Decoder Content
flagsDictDecoder =
    Json.Decode.map Content
        (Json.Decode.field "guides" Page.Guide.Data.guideDictDecoder)
