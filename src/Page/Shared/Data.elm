module Page.Shared.Data exposing (Content, contentDictDecoder)

import Dict exposing (Dict)
import Json.Decode
import Page.Data
import Page.Guide.Data
import Page.Story.Data


type alias Content =
    { guides : Page.Guide.Data.Guides
    , stories : Dict String Page.Story.Data.Story
    , pages : Dict String Page.Data.Page
    }


contentDictDecoder : Json.Decode.Value -> Content
contentDictDecoder flags =
    case Json.Decode.decodeValue flagsDictDecoder flags of
        Ok goodContent ->
            goodContent

        Err _ ->
            { guides = { cy = Dict.empty, en = Dict.empty }
            , stories = Dict.empty
            , pages = Dict.empty
            }


flagsDictDecoder : Json.Decode.Decoder Content
flagsDictDecoder =
    Json.Decode.map3 Content
        (Json.Decode.field "guides" Page.Guide.Data.guideLanguageDictDecoder)
        (Json.Decode.field "stories" Page.Story.Data.storyDictDecoder)
        (Json.Decode.field "pages" Page.Data.pageDictDecoder)
