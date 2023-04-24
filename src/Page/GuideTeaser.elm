module Page.GuideTeaser exposing (GuideTeaser, Image, guideTeaserEncoder, guideTeaserListEncoder, guideTeaserListString)

import Json.Encode as Encode


type alias Image =
    { src : String, alt : String }


type alias GuideTeaser =
    { title : String

    -- This will maybe turn into Url.Url when we include external resources
    , url : String
    , summary : String
    , maybeImage : Maybe Image
    }


guideTeaserEncoder : GuideTeaser -> Encode.Value
guideTeaserEncoder guideTeaser =
    Encode.object
        [ ( "title", Encode.string guideTeaser.title )
        , ( "url", Encode.string guideTeaser.url )
        , ( "summary", Encode.string guideTeaser.summary )
        , ( "maybeImage"
          , case guideTeaser.maybeImage of
                Just image ->
                    Encode.object [ ( "url", Encode.string image.src ), ( "alt", Encode.string image.alt ) ]

                Nothing ->
                    Encode.null
          )
        ]


guideTeaserListString : List GuideTeaser -> String
guideTeaserListString guideTeaserList =
    Encode.encode 0 (Encode.list guideTeaserEncoder guideTeaserList)


guideTeaserListEncoder : List GuideTeaser -> Encode.Value
guideTeaserListEncoder guideTeasers =
    Encode.list guideTeaserEncoder guideTeasers
