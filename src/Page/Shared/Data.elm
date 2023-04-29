module Page.Shared.Data exposing (Content, contentDictDecoder)

import Dict
import Json.Decode
import Page.Data
import Page.Guide.Data
import Page.Story.Data


type alias Content =
    { guides : Page.Guide.Data.Guides
    , pages : Page.Data.Pages
    , stories : Page.Story.Data.Stories
    }


contentDictDecoder : Json.Decode.Value -> Content
contentDictDecoder flags =
    case Json.Decode.decodeValue flagsDictDecoder flags of
        Ok goodContent ->
            goodContent

        Err _ ->
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
