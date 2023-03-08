module Example exposing (..)

import Expect
import Test exposing (Test, test)


suite : Test
suite =
    test "one plus one equals two" <|
        \_ -> (1 + 1) |> Expect.equal 2
