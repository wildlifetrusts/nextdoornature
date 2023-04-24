module Theme.HeaderTemplate exposing (view)

import Css exposing (Style, batch, fontFamilies, fontSize, margin, rem, zero)
import Html.Styled exposing (Html, a, div, h1, header, text)
import Html.Styled.Attributes exposing (css, href)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Route exposing (Route(..))


view : Language -> Route -> Html msg
view language route =
    let
        t : Key -> String
        t =
            translate language
    in
    header [] [ viewSiteTitle route (t SiteTitle) ]


viewSiteTitle : Route -> String -> Html msg
viewSiteTitle route siteTitle =
    if route == Index then
        h1 [ css [ headerBrandStyle ] ] [ text siteTitle ]

    else
        div [ css [ headerBrandStyle ] ]
            [ a [ href "/" ]
                [ text siteTitle
                ]
            ]


headerBrandStyle : Style
headerBrandStyle =
    batch
        [ fontSize (rem 4)
        , fontFamilies [ "Ludicrous" ]
        , margin zero
        ]
