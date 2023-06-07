module Page.Shared.Data exposing (AudioMeta, Teaser, TeaserImage, VideoMeta, audioDecoder, defaultTeaserImage, guideTeaserDecoder, guideTeaserImageDecoder, summaryFromPreview, videoDecoder)

import Json.Decode


type alias TeaserImage =
    { src : String, alt : String }


guideTeaserDecoder : Json.Decode.Decoder Teaser
guideTeaserDecoder =
    Json.Decode.map4 Teaser
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "basename" Json.Decode.string)
        (Json.Decode.field "preview" Json.Decode.string
            |> Json.Decode.andThen (\content -> Json.Decode.succeed (summaryFromPreview content))
        )
        (Json.Decode.maybe (Json.Decode.field "image" guideTeaserImageDecoder))


defaultTeaserImage : TeaserImage
defaultTeaserImage =
    { src = "/images/default-guide-image.jpg", alt = "" }


guideTeaserImageDecoder : Json.Decode.Decoder TeaserImage
guideTeaserImageDecoder =
    Json.Decode.map2 TeaserImage
        (Json.Decode.field "src" Json.Decode.string)
        (Json.Decode.field "alt" Json.Decode.string)


type alias Teaser =
    { title : String

    -- This will maybe turn into Url.Url when we include external resources
    , url : String
    , summary : String
    , maybeImage : Maybe TeaserImage
    }


type alias AudioMeta =
    { title : String
    , src : String
    }


audioDecoder : Json.Decode.Decoder AudioMeta
audioDecoder =
    Json.Decode.map2 AudioMeta
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "src" Json.Decode.string)


type alias VideoMeta =
    { title : String
    , src : String
    }


videoDecoder : Json.Decode.Decoder VideoMeta
videoDecoder =
    Json.Decode.map2 VideoMeta
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "src" Json.Decode.string)


summaryFromPreview : String -> String
summaryFromPreview content =
    content
        |> String.replace "#" ""
        |> String.replace "*" ""
