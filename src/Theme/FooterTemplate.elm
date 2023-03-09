module Theme.FooterTemplate exposing (view)

import Css exposing (Style, batch)
import Html.Styled exposing (Html, footer, h2, text)
import Html.Styled.Attributes exposing (css)


view : Html msg
view =
    footer [ css [ footerStyle ] ]
        [ h2
            []
            [ text "[cCc] Footer"
            ]
        ]


footerStyle : Style
footerStyle =
    batch
        []
