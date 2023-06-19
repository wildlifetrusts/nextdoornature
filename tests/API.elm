module API exposing (suite)

import Expect exposing (equal)
import Json.Decode
import Page.Search.Data exposing (actionTeaserDecoder, actionTeaserListDecoder, guideTeaserListString, internalGuideTeaserListDecoder)
import Test exposing (Test, describe, test)
import TestData exposing (actionsAPI, singleActionFromAPI, teaserFromResult, teaserFromResult2)


suite : Test
suite =
    describe "Wildlife trust API tests"
        [ test "actionTeaserDecoder works with a single JSON object from action API" <|
            \_ ->
                case Json.Decode.decodeString actionTeaserDecoder singleActionFromAPI of
                    Ok teaser ->
                        equal teaser teaserFromResult

                    Err err ->
                        Expect.fail (Json.Decode.errorToString err)
        , test "actionTeaserListDecoder works with a JSON object from action API" <|
            \_ ->
                case Json.Decode.decodeString actionTeaserListDecoder actionsAPI of
                    Ok list ->
                        equal list [ teaserFromResult, teaserFromResult2 ]

                    Err err ->
                        Expect.fail (Json.Decode.errorToString err)
        , test "internalGuideTeaserListDecoder works with encoded json" <|
            \_ ->
                let
                    json : String
                    json =
                        guideTeaserListString [ teaserFromResult, teaserFromResult2 ]
                in
                case Json.Decode.decodeString internalGuideTeaserListDecoder json of
                    Ok list ->
                        equal list [ teaserFromResult, teaserFromResult2 ]

                    Err err ->
                        Expect.fail (Json.Decode.errorToString err)
        ]
