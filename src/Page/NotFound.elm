module Page.NotFound exposing (resourceNotFound)

import Css exposing (Style, batch, margin3, pct, rem, width, maxWidth)

import Html.Styled exposing (Html, div, img, text, p, a)
import Html.Styled.Attributes exposing (alt, css, href, src)
import Theme.Global exposing (centerContent, contentWrapper, featureImageStyle, pageColumnBlockStyle, pageColumnStyle, primaryHeader, roundedCornerStyle, teaserImageStyle, topTwoColumnsWrapperStyle)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)


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
                        [ p [] [ text (t ResourceNotFoundText)]
                        , a [ href (t ResourceNotFoundLinkPath)] [ text (t ResourceNotFoundLinkText) ]
                        ]
                    ]
                , div [ css [ pageColumnStyle ] ]
                    [ img [ src "/images/badger-question.png", css [ badgeImageStyle ] ] [] ]
                ]
            ]
        ]
            
badgeImageStyle : Style
badgeImageStyle =
    batch 
        [ -- width (pct 50)
        ]