module Page.Data exposing (Page, pageDictDecoder, pageFromSlug)

import Dict exposing (Dict)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Json.Decode
import Json.Decode.Extra


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


pageFromSlug : Language -> Dict String Page -> String -> Page
pageFromSlug language pages slug =
    case Dict.get slug pages of
        Just aPage ->
            aPage

        Nothing ->
            blankPage language
