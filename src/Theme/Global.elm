module Theme.Global exposing (centerContent)

import Css exposing (Style, absolute, alignItems, auto, batch, boxSizing, center, ch, column, contentBox, displayFlex, flexDirection, height, hidden, left, marginLeft, marginRight, maxWidth, overflow, position, px, top, width)
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
-- Transitions
-- Buttons (components)
-- Buttons (styles)
-- Titles
-- Page Elements
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
            []
        , typeSelector "h1"
            []
        , typeSelector "h2"
            []
        , typeSelector "h3"
            []
        , typeSelector "h4"
            []
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
