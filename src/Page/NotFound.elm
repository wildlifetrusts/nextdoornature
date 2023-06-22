module Page.NotFound exposing (resourceNotFound)

import Css exposing (Style, alignItems, batch, center, column, displayFlex, flexDirection, flexStart, justifyContent, marginBottom, maxWidth, pct, rem, row, spaceBetween, width)
import Html.Styled exposing (Html, a, div, img, p, text)
import Html.Styled.Attributes exposing (css, href, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Theme.Global exposing (centerContent, pageColumnStyle, primaryHeader, simplePageContentContainerStyle, withMediaMobileUp)


resourceNotFound : Language -> Html msg
resourceNotFound language =
    let
        t : Key -> String
        t =
            translate language
    in
    div [ css [ centerContent, simplePageContentContainerStyle ] ]
        [ div [ css [ simpleTwoColumnsFlexStyle ] ]
            [ div [ css [ pageColumnStyle ] ]
                [ primaryHeader [] (t ResourceNotFoundTitle)
                , div []
                    [ p [] [ text (t ResourceNotFoundText) ]
                    , a [ href (t ResourceNotFoundLinkPath) ] [ text (t ResourceNotFoundLinkText) ]
                    ]
                ]
            , img [ src "/images/badger-question.png", css [ badgerImageStyle ] ] []
            ]
        ]


badgerImageStyle : Style
badgerImageStyle =
    batch
        [ maxWidth (rem 20)
        , marginBottom (rem 1)
        ]


simpleTwoColumnsFlexStyle : Style
simpleTwoColumnsFlexStyle =
    batch
        [ alignItems center
        , displayFlex
        , flexDirection column
        , width (pct 100)
        , withMediaMobileUp
            [ alignItems flexStart
            , flexDirection row
            , justifyContent spaceBetween
            ]
        ]
