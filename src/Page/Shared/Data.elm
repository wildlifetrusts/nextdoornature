module Page.Shared.Data exposing (AudioMeta, GuideTeaser, GuideTeaserImage, VideoMeta, audioDecoder, defaultTeaserImage, guideTeaserImageDecoder, videoDecoder)

import Json.Decode


type alias GuideTeaserImage =
    { src : String, alt : String }


defaultTeaserImage : GuideTeaserImage
defaultTeaserImage =
    { src = "/images/default-guide-image.jpg", alt = "" }


guideTeaserImageDecoder : Json.Decode.Decoder GuideTeaserImage
guideTeaserImageDecoder =
    Json.Decode.map2 GuideTeaserImage
        (Json.Decode.field "src" Json.Decode.string)
        (Json.Decode.field "alt" Json.Decode.string)


type alias GuideTeaser =
    { title : String

    -- This will maybe turn into Url.Url when we include external resources
    , url : String
    , summary : String
    , maybeImage : Maybe GuideTeaserImage
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
