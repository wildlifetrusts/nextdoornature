module API exposing (..)

import Expect exposing (equal)
import Json.Decode
import Page.GuideTeaser exposing (guideTeaserListString)
import Page.Shared.View exposing (actionTeaserDecoder, actionTeaserListDecoder, interalGuideTeaserListDecoder, internalGuideTeaserDecoder)
import Test exposing (Test, describe, test)
import TestData exposing (..)


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
                    json =
                        guideTeaserListString [ teaserFromResult, teaserFromResult2 ]
                in
                case Json.Decode.decodeString interalGuideTeaserListDecoder json of
                    Ok list ->
                        equal list [ teaserFromResult, teaserFromResult2 ]

                    Err err ->
                        Expect.fail (Json.Decode.errorToString err)
        ]
