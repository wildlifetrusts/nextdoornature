module Page.Data exposing (Page, Pages, pageFromSlug, pageLanguageDictDecoder)

import Dict exposing (Dict)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Json.Decode
import Json.Decode.Extra


type alias Pages =
    { cy : Dict String Page
    , en : Dict String Page
    }


type alias Page =
    { title : String
    , slug : String
    , fullTextMarkdown : String
    }


blankPage : Language -> Page
blankPage language =
    let
        t : Key -> String
        t =
            translate language
    in
    { title = t AncillaryPage404Title
    , slug = t AncillaryPage404Slug
    , fullTextMarkdown = t AncillaryPage404Body
    }


pageDictDecoder : Json.Decode.Decoder (Dict String Page)
pageDictDecoder =
    Json.Decode.dict
        (Json.Decode.succeed Page
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "title" Json.Decode.string |> Json.Decode.Extra.withDefault "")
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "basename" Json.Decode.string |> Json.Decode.Extra.withDefault "")
            |> Json.Decode.Extra.andMap
                (Json.Decode.field "content" Json.Decode.string |> Json.Decode.Extra.withDefault "")
        )


pageLanguageDictDecoder : Json.Decode.Decoder Pages
pageLanguageDictDecoder =
    Json.Decode.map2 Pages
        (Json.Decode.field "cy" pageDictDecoder)
        (Json.Decode.field "en" pageDictDecoder)


pagesInPreferredLanguage : Language -> Pages -> Dict String Page
pagesInPreferredLanguage language pages =
    case language of
        English ->
            pages.en

        Welsh ->
            pages.cy


fallbackPages : Language -> Pages -> Dict String Page
fallbackPages language pages =
    case language of
        English ->
            pages.cy

        Welsh ->
            pages.en


pageFromSlug : Language -> Pages -> String -> Maybe Page
pageFromSlug language pages slug =
    case Dict.get slug (pagesInPreferredLanguage language pages) of
        Just aPage ->
            Just aPage

        Nothing ->
            Dict.get slug (fallbackPages language pages)
