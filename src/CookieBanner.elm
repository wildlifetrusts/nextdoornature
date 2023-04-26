port module CookieBanner exposing (saveConsent, viewCookieBanner)

import Css exposing (Style, auto, backgroundColor, backgroundImage, backgroundPosition, backgroundPosition2, backgroundRepeat, backgroundSize, batch, border, bottom, center, color, contain, display, em, ex, fixed, fontSize, height, inlineBlock, margin, marginLeft, marginRight, minHeight, noRepeat, padding, padding2, padding4, position, pseudoElement, px, rem, solid, textAlign, url, vw, width)
import Html.Styled exposing (Html, button, div, h2, p, text)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Message exposing (Msg(..))
import Shared exposing (CookieState)
import String exposing (left, right)
import Theme.Global exposing (lightTeal, purple, teal, white, withMediaMobileUp)


viewCookieBanner : Language -> CookieState -> Html Msg
viewCookieBanner language cookieState =
    div [ css [ viewCookieBannerStyles ] ]
        [ if cookieState.cookieBannerIsOpen then
            viewCookieBannerContent language

          else
            viewCookieSettingsButton language
        ]


viewCookieBannerContent : Language -> Html Msg
viewCookieBannerContent language =
    let
        t : Key -> String
        t =
            translate language
    in
    div [ css [ padding4 (rem 0) (rem 1) (rem 1) (rem 1) ] ]
        [ h2 [] [ text (t CookieBannerH2) ]
        , p
            [ css [ width (vw 100) ]
            ]
            [ text (t CookieBannerP) ]
        , button [ css [ cookieBtnStyle ], onClick CookiesDeclined ]
            [ text (t CookieDeclineButtonText) ]
        , button [ css [ cookieBtnStyle ], onClick CookiesAccepted ]
            [ text (t CookieAcceptButtonText) ]
        ]


viewCookieSettingsButton : Language -> Html Msg
viewCookieSettingsButton language =
    button [ css [ cookieBtnStyle, marginRight (rem 0) ], onClick CookieSettingsButtonClicked ]
        [ text (translate language CookieSettingsButtonText) ]


port saveConsent : Bool -> Cmd msg


viewCookieBannerStyles : Style
viewCookieBannerStyles =
    batch
        [ backgroundColor lightTeal
        , bottom (px 0)
        , Css.borderTop3 (rem 0.25) solid purple
        , position fixed
        ]


cookieBtnStyle : Style
cookieBtnStyle =
    batch
        [ pseudoElement "after"
            [ backgroundImage (url "images/arrow--white.svg")
            , backgroundSize contain
            , backgroundPosition center
            , backgroundRepeat noRepeat
            , display inlineBlock
            , Css.property "content" "' '"
            , height (ex 1.5)
            , width (em 1.0)
            , marginLeft (em 0.3)
            ]
        , color white
        , backgroundColor purple
        , border (px 0)
        , fontSize (rem 1)
        , padding2 (rem 0.3) (rem 0.5)
        , marginRight (rem 0.5)
        ]
