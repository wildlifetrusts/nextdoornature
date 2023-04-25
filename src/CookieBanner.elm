port module CookieBanner exposing (saveConsent, viewCookieBanner)

import Css exposing (Style, backgroundColor, batch, bottom, fixed, position, px, rem, solid, vw, width)
import Html.Styled exposing (Html, button, div, h2, p, text)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Message exposing (Msg(..))
import Shared exposing (CookieState)
import Theme.FluidScale
import Theme.Global exposing (lightTeal, purple)


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
    div []
        [ h2 [ css [ Theme.FluidScale.fontSize1 ] ] [ text (t CookieBannerH2) ]
        , p
            [ css [ width (vw 100) ]
            ]
            [ text (t CookieBannerP) ]
        , button [ onClick CookiesDeclined ] [ text (t CookieDeclineButtonText) ]
        , button [ onClick CookiesAccepted ] [ text (t CookieAcceptButtonText) ]
        ]


viewCookieSettingsButton : Language -> Html Msg
viewCookieSettingsButton language =
    button [ onClick CookieSettingsButtonClicked ]
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
