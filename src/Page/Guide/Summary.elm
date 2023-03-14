module Page.Guide.Summary exposing (Summary, init, toString)

import String exposing (length)


type Summary
    = Summary String



{-
   string of <=240 chars -> Just (Summary s)
   else Nothing
-}


init : String -> Maybe Summary
init s =
    if length s <= 240 then
        Just (Summary s)

    else
        Nothing


toString : Summary -> String
toString (Summary s) =
    s
