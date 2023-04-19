module Page.Shared exposing (GuideTeaser, Image)


type alias Image =
    { src : String, alt : String }


type alias GuideTeaser =
    { title : String

    -- This will maybe turn into Url.Url when we include external resources
    , url : String
    , summary : String
    , maybeImage : Maybe Image
    }
