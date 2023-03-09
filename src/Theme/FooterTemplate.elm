module Theme.FooterTemplate exposing (view)

import Css exposing (Style, batch)
import Html.Styled exposing (Html, footer, h2, text)
import Html.Styled.Attributes exposing (css)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Shared exposing (Model, Msg(..))


view : Model -> Html msg
view model =
    let
        t =
            translate model.language
    in
    footer [ css [ footerStyle ] ]
        [ h2
            []
            [ text (t FooterText)
            ]
        ]


footerStyle : Style
footerStyle =
    batch
        []
