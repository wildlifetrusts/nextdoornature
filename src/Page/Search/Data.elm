module Page.Search.Data exposing (SearchableTeaser, actionTeaserDecoder, actionTeaserListDecoder, getTeaserListsFromSearch, internalGuideTeaserListDecoder, searchDataFromSearchableTeaserList, searchResultEncoder, searchTeaserListString, searchableTeaserDecoder, searchableTeaserListFromSearchData, teaserListFromGuideDict, teaserListFromStoryDict)

import Dict
import I18n.Translate exposing (Language)
import Json.Decode
import Json.Decode.Extra
import Json.Encode as Encode
import List
import Page.Guide.Data
import Page.Shared.Data
import Page.Story.Data
import Route
import Shared exposing (Request(..))


type alias SearchableTeaser =
    { itemType : Shared.Searchable
    , title : String
    , url : String
    , summary : String
    , maybeImage : Maybe Page.Shared.Data.TeaserImage
    }


searchTeaserEncoder : SearchableTeaser -> Encode.Value
searchTeaserEncoder teaser =
    Encode.object
        [ ( "title", Encode.string teaser.title )
        , ( "url", Encode.string teaser.url )
        , ( "summary", Encode.string teaser.summary )
        , ( "maybeImage"
          , case teaser.maybeImage of
                Just image ->
                    Encode.object [ ( "src", Encode.string image.src ), ( "alt", Encode.string image.alt ) ]

                Nothing ->
                    Encode.null
          )
        , ( "itemType", Encode.string (Shared.searchableToString teaser.itemType) )
        ]


searchResultEncoder : List SearchableTeaser -> Encode.Value
searchResultEncoder combinedTeaserList =
    Encode.list searchTeaserEncoder combinedTeaserList


searchTeaserListString : List SearchableTeaser -> String
searchTeaserListString teaserList =
    Encode.encode 0 (Encode.list searchTeaserEncoder teaserList)


searchableTeaserListFromSearchData : Shared.SearchData -> List SearchableTeaser
searchableTeaserListFromSearchData searchData =
    List.map
        (\item ->
            { itemType = Shared.Action
            , title = item.title
            , url = item.url
            , summary = item.summary
            , maybeImage = item.maybeImage
            }
        )
        searchData.actions
        ++ List.map
            (\item ->
                { itemType = Shared.Guide
                , title = item.title
                , url = item.url
                , summary = item.summary
                , maybeImage = item.maybeImage
                }
            )
            searchData.guides
        ++ List.map
            (\item ->
                { itemType = Shared.Story
                , title = item.title
                , url = item.url
                , summary = item.summary
                , maybeImage = item.maybeImage
                }
            )
            searchData.stories


searchDataFromSearchableTeaserList : Json.Decode.Decoder (List SearchableTeaser) -> Json.Decode.Decoder Shared.SearchData
searchDataFromSearchableTeaserList teasers =
    teasers
        |> Json.Decode.andThen
            (\teaserList ->
                Json.Decode.succeed
                    { actions = teasersFromSearchableType Shared.Action teaserList
                    , guides = teasersFromSearchableType Shared.Guide teaserList
                    , stories = teasersFromSearchableType Shared.Story teaserList
                    }
            )


teasersFromSearchableType : Shared.Searchable -> List SearchableTeaser -> List Page.Shared.Data.Teaser
teasersFromSearchableType itemType teasers =
    List.filter
        (\item -> item.itemType == itemType)
        teasers
        |> List.map
            (\item ->
                { title = item.title
                , url = item.url
                , summary = item.summary
                , maybeImage = item.maybeImage
                }
            )


getTeaserListsFromSearch : Shared.Model -> Shared.SearchData
getTeaserListsFromSearch model =
    let
        hasResults =
            List.length model.searchResult.actions
                > 0
                || List.length model.searchResult.guides
                > 0
                || List.length model.searchResult.stories
                > 0
    in
    if String.length model.query > 0 && hasResults then
        let
            actionResults : List Page.Shared.Data.Teaser
            actionResults =
                if List.length model.searchResult.actions > 0 then
                    model.searchResult.actions

                else
                    []

            guideResults : List Page.Shared.Data.Teaser
            guideResults =
                if List.length model.searchResult.guides > 0 then
                    model.searchResult.guides

                else
                    []

            storyResults : List Page.Shared.Data.Teaser
            storyResults =
                if List.length model.searchResult.stories > 0 then
                    model.searchResult.stories

                else
                    []
        in
        { actions = actionResults
        , guides = guideResults
        , stories = storyResults
        }

    else
        { actions = actionsListFromApi model.externalActions
        , guides = teaserListFromGuideDict model.language model.content.guides
        , stories = teaserListFromStoryDict model.language model.content.stories
        }


actionsListFromApi : Request -> List Page.Shared.Data.Teaser
actionsListFromApi requestActions =
    case requestActions of
        Failure ->
            []

        Loading ->
            []

        Success list ->
            list


teaserListFromGuideDict :
    Language
    -> Page.Guide.Data.Guides
    -> List Page.Shared.Data.Teaser
teaserListFromGuideDict language guides =
    Dict.values (Page.Guide.Data.guidesInPreferredLanguage language guides)
        |> List.map
            (\g ->
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
    Dict.values (Page.Story.Data.storiesInPreferredLanguage language stories)
        |> List.map
            (\s ->
                { title = s.title
                , url = Route.toString (Route.Story s.slug)
                , summary = s.summary
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


searchableTeaserDecoder : Json.Decode.Decoder SearchableTeaser
searchableTeaserDecoder =
    Json.Decode.map5 SearchableTeaser
        (Json.Decode.field "itemType" Json.Decode.string |> Json.Decode.andThen searchableFromStringDecoder)
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "url" Json.Decode.string)
        (Json.Decode.field "summary" Json.Decode.string |> Json.Decode.Extra.withDefault "")
        (Json.Decode.maybe (Json.Decode.field "maybeImage" Page.Shared.Data.guideTeaserImageDecoder))


searchableFromStringDecoder : String -> Json.Decode.Decoder Shared.Searchable
searchableFromStringDecoder itemType =
    case itemType of
        "action" ->
            Json.Decode.succeed Shared.Action

        "guide" ->
            Json.Decode.succeed Shared.Guide

        "story" ->
            Json.Decode.succeed Shared.Guide

        _ ->
            Json.Decode.succeed Shared.Guide


internalGuideTeaserDecoder : Json.Decode.Decoder Page.Shared.Data.Teaser
internalGuideTeaserDecoder =
    Json.Decode.map4 Page.Shared.Data.Teaser
        (Json.Decode.field "title" Json.Decode.string)
        (Json.Decode.field "url" Json.Decode.string)
        (Json.Decode.field "summary" Json.Decode.string |> Json.Decode.Extra.withDefault "")
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
