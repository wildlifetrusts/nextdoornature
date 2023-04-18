module API exposing (..)

import Expect exposing (equal, ok)
import Json.Decode
import Page.Shared.View exposing (actionTeaserDecoder, actionTeaserListDecoder)
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
                        equal list [ teaserFromResult, teaserFromResult ]

                    Err err ->
                        Expect.fail (Json.Decode.errorToString err)
        ]
