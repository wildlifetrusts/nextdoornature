module Page.NotFound exposing (resourceNotFound)

import Css exposing (Style, batch, pct, width)
import Html.Styled exposing (Html, a, div, img, p, text)
import Html.Styled.Attributes exposing (css, href, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Theme.Global exposing (centerContent, contentWrapper, pageColumnStyle, primaryHeader, topTwoColumnsWrapperStyle)


resourceNotFound : Language -> Html msg
resourceNotFound language =
    let
        t : Key -> String
        t =
            translate language
    in
    div [ css [ centerContent ] ]
        [ div [ css [ contentWrapper, width (pct 100) ] ]
            [ div [ css [ topTwoColumnsWrapperStyle ] ]
                [ div [ css [ pageColumnStyle ] ]
                    [ primaryHeader [] (t ResourceNotFoundTitle)
                    , div []
                        [ p [] [ text (t ResourceNotFoundText) ]
                        , a [ href (t ResourceNotFoundLinkPath) ] [ text (t ResourceNotFoundLinkText) ]
                        ]
                    ]
                , div [ css [ pageColumnStyle ] ]
                    [ img [ src "/images/badger-question.png", css [ badgeImageStyle ] ] [] ]
                ]
            ]
        ]


badgeImageStyle : Style
badgeImageStyle =
    batch []
