module TestUtils exposing (queryFromStyledHtml)

import Html.Styled as Styled
import Test.Html.Query as Query


{-| The Test suite expects Html, not Styled.Html.
Use this to convert styled html into test query html.
After that we can use the testing libraries on our views.
-}
queryFromStyledHtml : Styled.Html msg -> Query.Single msg
queryFromStyledHtml view =
    view
        |> Styled.toUnstyled
        |> Query.fromHtml
