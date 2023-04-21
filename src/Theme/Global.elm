module Theme.Global exposing (centerContent, globalStyles, lightTeal, purple, roundedCorners, teal)

import Css exposing (Color, Style, absolute, alignItems, auto, batch, borderBottomRightRadius, borderTopLeftRadius, borderTopRightRadius, boxSizing, center, ch, color, column, contentBox, displayFlex, flexDirection, fontFamilies, height, hex, hidden, left, margin, marginLeft, marginRight, maxWidth, overflow, position, px, rem, top, width, zero)
import Css.Global exposing (global, typeSelector)
import Css.Media as Media exposing (only, screen, withMedia)
import Html.Styled exposing (Html)



-- Accessibility helpers


screenReaderOnly : Style
screenReaderOnly =
    batch
        [ position absolute
        , left (px -10000)
        , top auto
        , width (px 1)
        , height (px 1)
        , overflow hidden
        ]



-- Breakpoints


maxMobile : Float
maxMobile =
    600


withMediaMobileOnly : List Style -> Style
withMediaMobileOnly =
    withMedia [ only screen [ Media.maxWidth (px (maxMobile - 1)) ] ]


withMediaTabletPortraitUp : List Style -> Style
withMediaTabletPortraitUp =
    withMedia [ only screen [ Media.minWidth (px maxMobile) ] ]


maxTabletPortrait : Float
maxTabletPortrait =
    900


withMediaTabletLandscapeUp : List Style -> Style
withMediaTabletLandscapeUp =
    withMedia [ only screen [ Media.minWidth (px maxTabletPortrait) ] ]


maxTabletLandscape : Float
maxTabletLandscape =
    1200


withMediaSmallDesktopUp : List Style -> Style
withMediaSmallDesktopUp =
    withMedia [ only screen [ Media.minWidth (px maxTabletLandscape) ] ]


maxSmallDesktop : Float
maxSmallDesktop =
    1500


withMediaMediumDesktopUp : List Style -> Style
withMediaMediumDesktopUp =
    withMedia [ only screen [ Media.minWidth (px maxSmallDesktop) ] ]



-- Brand colours
-- Accent colours
-- Text and background colours


purple : Color
purple =
    hex "54257F"


teal : Color
teal =
    hex "058295"


lightTeal : Color
lightTeal =
    hex "e7f2f4"



-- Transitions
-- Buttons (components)
-- Buttons (styles)
-- Titles
-- Page Elements


roundedCornerValue : Float
roundedCornerValue =
    2


roundedCorners : List Style
roundedCorners =
    [ borderTopLeftRadius (rem roundedCornerValue)
    , borderTopRightRadius (rem roundedCornerValue)
    , borderBottomRightRadius (rem roundedCornerValue)
    , overflow hidden
    ]



-- Text styles
-- Form field components
-- Form field styles
-- Global


{-| Injects a <style> tag into the body, and can target element or
class selectors anywhere, including outside the Elm app.
-}
globalStyles : Html msg
globalStyles =
    global
        [ typeSelector "body"
            [ fontFamilies [ "Rubik", "sans-serif" ]
            , margin zero
            ]
        , typeSelector "h1"
            [ fontFamilies [ "Adelle", "serif" ]
            , color purple
            ]
        , typeSelector "h2"
            [ fontFamilies [ "Adelle", "serif" ]
            , color purple
            ]
        , typeSelector "h3"
            [ fontFamilies [ "Adelle", "serif" ]
            , color purple
            ]
        , typeSelector "h4"
            [ fontFamilies [ "Adelle", "serif" ]
            , color purple
            ]
        , typeSelector "a"
            [ color purple
            ]
        , typeSelector "b"
            []
        , typeSelector "p"
            []
        , typeSelector "blockquote"
            []
        ]



-- Helpers


centerContent : Style
centerContent =
    batch
        [ boxSizing contentBox
        , maxWidth (ch 60)
        , marginLeft auto
        , marginRight auto
        , displayFlex
        , flexDirection column
        , alignItems center
        ]



-- Map
