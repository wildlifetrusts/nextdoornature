port module CookieBanner exposing (saveConsent, viewCookieBanner)

import Css exposing (Style, backgroundColor, backgroundImage, backgroundPosition, backgroundRepeat, backgroundSize, batch, border, borderTop3, bottom, center, color, contain, display, em, ex, fixed, fontSize, height, inlineBlock, marginLeft, marginRight, minHeight, noRepeat, padding2, paddingBottom, paddingTop, pct, position, pseudoElement, px, rem, solid, url, width)
import Html.Styled exposing (Html, button, div, h2, p, text)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Message exposing (Msg(..))
import Shared exposing (CookieState)
import Theme.Global exposing (centerContent, hideFromPrint, lightTeal, purple, white, withMediaMobileUp)


viewCookieBanner : Language -> CookieState -> Html Msg
viewCookieBanner language cookieState =
    if cookieState.cookieBannerIsOpen then
        div [ css [ viewCookieBannerStyles, hideFromPrint ] ]
            [ viewCookieBannerContent language
            ]

    else
        div [ css [ viewCookieButtonStyles, hideFromPrint ] ]
            [ viewCookieSettingsButton language
            ]


viewCookieBannerContent : Language -> Html Msg
viewCookieBannerContent language =
    let
        t : Key -> String
        t =
            translate language
    in
    div [ css [ outerPadding, centerContent ] ]
        [ div [ css [ innerContainer ] ]
            [ h2 [] [ text (t CookieBannerH2) ]
            , p
                []
                [ text (t CookieBannerP) ]
            , button [ css [ cookieBtnStyle ], onClick CookiesDeclined ]
                [ text (t CookieDeclineButtonText) ]
            , button [ css [ cookieBtnStyle ], onClick CookiesAccepted ]
                [ text (t CookieAcceptButtonText) ]
            ]
        ]


viewCookieSettingsButton : Language -> Html Msg
viewCookieSettingsButton language =
    button [ css [ cookieBtnStyle, marginRight (rem 0) ], onClick CookieSettingsButtonClicked ]
        [ text (translate language CookieSettingsButtonText) ]


port saveConsent : Bool -> Cmd msg


viewCookieBannerStyles : Style
viewCookieBannerStyles =
    batch
        [ viewCookieButtonStyles
        , width (pct 100)
        ]


viewCookieButtonStyles : Style
viewCookieButtonStyles =
    batch
        [ backgroundColor lightTeal
        , bottom (px 0)
        , borderTop3 (rem 0.5) solid purple
        , position fixed
        ]


outerPadding : Style
outerPadding =
    batch
        [ paddingBottom (rem 0.5)
        , paddingTop (rem 0.5)
        , withMediaMobileUp
            [ paddingBottom (rem 0.5)
            , paddingTop (rem 0.5)
            ]
        ]


innerContainer : Style
innerContainer =
    batch
        [ minHeight (rem 13)
        , width (pct 100)
        ]


cookieBtnStyle : Style
cookieBtnStyle =
    batch
        [ color white
        , backgroundColor purple
        , border (px 0)
        , fontSize (rem 1)
        , padding2 (rem 0.3) (rem 0.5)
        , marginRight (rem 0.5)
        ]
