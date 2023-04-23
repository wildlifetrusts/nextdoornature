module Theme.HeaderTemplate exposing (view)

import Css exposing (Style, batch)
import Html.Styled exposing (Html, div, h1, header, text)
import Html.Styled.Attributes exposing (css)
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
    header [ css [ headerStyle ] ]
        [ viewSiteTitle route (t SiteTitle)
        ]


viewSiteTitle : Route -> String -> Html msg
viewSiteTitle route siteTitle =
    if route == Index then
        h1 [] [ text siteTitle ]

    else
        div [] [ text siteTitle ]


headerStyle : Style
headerStyle =
    batch
        []
