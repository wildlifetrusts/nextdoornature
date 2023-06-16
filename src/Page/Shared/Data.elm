module Page.Shared.Data exposing (AudioMeta, Teaser, TeaserImage, VideoMeta, audioDecoder, defaultTeaserImage, guideTeaserImageDecoder, videoDecoder)

import Json.Decode


type alias TeaserImage =
    { src : String, alt : String }


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
    , description : String
    }


videoDecoder : Json.Decode.Decoder VideoMeta
videoDecoder =
    Json.Decode.map3 VideoMeta
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "id"
            (Json.Decode.string
                |> Json.Decode.andThen idToEmbedSrc
            )
        )
        (Json.Decode.field "description" Json.Decode.string)


idToEmbedSrc : String -> Json.Decode.Decoder String
idToEmbedSrc videoId =
    Json.Decode.succeed ("https://youtube.com/embed/" ++ videoId)
