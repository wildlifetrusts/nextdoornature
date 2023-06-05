module Page.Guides.Data exposing (actionTeaserDecoder, actionTeaserListDecoder, guideTeaserDecoder, guideTeaserListEncoder, guideTeaserListString, internalGuideTeaserDecoder, internalGuideTeaserListDecoder, teaserListFromGuideDict, teaserListFromStoryDict)

import Dict
import I18n.Translate exposing (Language)
import Json.Decode
import Json.Encode as Encode
import List
import Page.Guide.Data
import Page.Shared.Data
import Page.Story.Data
import Route


guideTeaserDecoder : Json.Decode.Decoder Page.Shared.Data.Teaser
guideTeaserDecoder =
    Json.Decode.map4 Page.Shared.Data.Teaser
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "basename" Json.Decode.string)
        (Json.Decode.field "summary" Json.Decode.string)
        (Json.Decode.maybe (Json.Decode.field "image" Page.Shared.Data.guideTeaserImageDecoder))


guideTeaserEncoder : Page.Shared.Data.Teaser -> Encode.Value
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


guideTeaserListString : List Page.Shared.Data.Teaser -> String
guideTeaserListString guideTeaserList =
    Encode.encode 0 (Encode.list guideTeaserEncoder guideTeaserList)


guideTeaserListEncoder : List Page.Shared.Data.Teaser -> Encode.Value
guideTeaserListEncoder guideTeasers =
    Encode.list guideTeaserEncoder guideTeasers


teaserListFromGuideDict :
    Language
    -> Page.Guide.Data.Guides
    -> List Page.Shared.Data.Teaser
teaserListFromGuideDict language guides =
    Dict.toList (Page.Guide.Data.guidesInPreferredLanguage language guides)
        |> List.map
            (\( _, g ) ->
                { title = g.title
                , url = Route.toString (Route.Guide g.slug)
                , summary = g.summary
                , maybeImage = guideImagefromTeaserImage g.maybeImage
                }
            )
        |> List.sortBy .title


teaserListFromStoryDict :
    Language
    -> Page.Story.Data.Stories
    -> List Page.Shared.Data.Teaser
teaserListFromStoryDict language stories =
    Dict.toList (Page.Story.Data.storiesInPreferredLanguage language stories)
        |> List.map
            (\( _, s ) ->
                { title = s.title
                , url = Route.toString (Route.Story s.slug)
                , summary = ""
                , maybeImage = storyImagefromTeaserImage s.images
                }
            )
        |> List.sortBy .title


guideImagefromTeaserImage : Maybe Page.Guide.Data.Image -> Maybe Page.Shared.Data.TeaserImage
guideImagefromTeaserImage maybeImage =
    case maybeImage of
        Just anImage ->
            Just { alt = anImage.alt, src = anImage.src }

        Nothing ->
            Just Page.Shared.Data.defaultTeaserImage


storyImagefromTeaserImage : List Page.Story.Data.Image -> Maybe Page.Shared.Data.TeaserImage
storyImagefromTeaserImage maybeImages =
    case List.head maybeImages of
        Just anImage ->
            Just { alt = anImage.alt, src = anImage.src }

        Nothing ->
            Just Page.Shared.Data.defaultTeaserImage


internalGuideTeaserDecoder : Json.Decode.Decoder Page.Shared.Data.Teaser
internalGuideTeaserDecoder =
    Json.Decode.map4 Page.Shared.Data.Teaser
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "url" Json.Decode.string)
        (Json.Decode.field "summary" Json.Decode.string)
        (Json.Decode.maybe (Json.Decode.field "maybeImage" Page.Shared.Data.guideTeaserImageDecoder))


internalGuideTeaserListDecoder : Json.Decode.Decoder (List Page.Shared.Data.Teaser)
internalGuideTeaserListDecoder =
    Json.Decode.list internalGuideTeaserDecoder


actionTeaserDecoder : Json.Decode.Decoder Page.Shared.Data.Teaser
actionTeaserDecoder =
    Json.Decode.map4 Page.Shared.Data.Teaser
        (Json.Decode.at [ "attributes", "title" ] Json.Decode.string)
        (Json.Decode.at [ "attributes", "path", "alias" ] Json.Decode.string
            |> Json.Decode.andThen (\url -> Json.Decode.succeed ("https://www.wildlifetrusts.org" ++ url))
        )
        (Json.Decode.at [ "attributes", "field_action_summary", "value" ] Json.Decode.string)
        (Json.Decode.maybe (Json.Decode.field "image" Page.Shared.Data.guideTeaserImageDecoder))


actionTeaserListDecoder : Json.Decode.Decoder (List Page.Shared.Data.Teaser)
actionTeaserListDecoder =
    Json.Decode.field "data" <| Json.Decode.list actionTeaserDecoder
