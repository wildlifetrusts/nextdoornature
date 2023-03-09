module Theme.FooterTemplate exposing (view)

import Css exposing (Style, batch)
import Html.Styled exposing (Html, footer, h2, text, img, p)
import Html.Styled.Attributes exposing (css, src)
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
        [ img [ src "/images/dfl-logo.svg" ] []
        , h2
            []
            [ text (t FooterText)
            ]
        , p []
            [ text (t ProjectInfo)
            ]
        ]


footerStyle : Style
footerStyle =
    batch
        []
