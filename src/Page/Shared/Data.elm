module Page.Shared.Data exposing (contentDictDecoder)

import Dict
import Json.Decode
import Page.Data
import Page.Guide.Data
import Page.Story.Data
import Shared


contentDictDecoder : Json.Decode.Value -> Shared.Content
contentDictDecoder flags =
    case Json.Decode.decodeValue flagsDictDecoder flags of
        Ok goodContent ->
            goodContent

        Err error ->
            let
                e =
                    Debug.log "Flag decode ERROR" error
            in
            { guides = { cy = Dict.empty, en = Dict.empty }
            , pages = { cy = Dict.empty, en = Dict.empty }
            , stories = { cy = Dict.empty, en = Dict.empty }
            }


flagsDictDecoder : Json.Decode.Decoder Shared.Content
flagsDictDecoder =
    Json.Decode.map3 Shared.Content
        (Json.Decode.field "guides" Page.Guide.Data.guideLanguageDictDecoder)
        (Json.Decode.field "pages" Page.Data.pageLanguageDictDecoder)
        (Json.Decode.field "stories" Page.Story.Data.storyLanguageDictDecoder)
