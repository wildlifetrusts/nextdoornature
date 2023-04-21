module Theme.Global exposing (centerContent, globalStyles, pageColumnBlockStyle, pageColumnStyle, pageWrapperStyle, topTwoColumnsWrapperStyle)

import Css exposing (Style, absolute, alignItems, auto, batch, boxSizing, center, column, contentBox, displayFlex, flex, flexDirection, flexStart, flexWrap, fontFamilies, height, hidden, int, justifyContent, lastChild, left, marginBottom, marginLeft, marginRight, marginTop, maxWidth, minWidth, noWrap, overflow, padding, padding2, pct, position, px, rem, row, top, width, wrap)
import Css.Global exposing (col, global, typeSelector)
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


maxTabletPortrait : Float
maxTabletPortrait =
    900


maxTabletLandscape : Float
maxTabletLandscape =
    1200


maxSmallDesktop : Float
maxSmallDesktop =
    1500


withMediaMobileOnly : List Style -> Style
withMediaMobileOnly =
    withMedia [ only screen [ Media.maxWidth (px (maxMobile - 1)) ] ]


withMediaTabletPortraitUp : List Style -> Style
withMediaTabletPortraitUp =
    withMedia [ only screen [ Media.minWidth (px maxTabletPortrait) ] ]


withMediaTabletLandscapeUp : List Style -> Style
withMediaTabletLandscapeUp =
    withMedia [ only screen [ Media.minWidth (px maxTabletLandscape) ] ]



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
            [ fontFamilies [ "Rubik", "sans-serif" ] ]
        , typeSelector "h1"
            [ fontFamilies [ "Adelle", "serif" ] ]
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
        , maxWidth (px maxSmallDesktop)
        , marginLeft auto
        , marginRight auto
        , displayFlex
        , flexDirection column
        , alignItems center
        ]


pageWrapperStyle : Style
pageWrapperStyle =
    batch
        [ alignItems flexStart
        , displayFlex
        , flexDirection column
        , flexWrap noWrap
        , justifyContent center
        , padding2 (rem 3) (rem 4)
        , withMediaTabletLandscapeUp
            [ flexDirection row
            ]
        ]


topTwoColumnsWrapperStyle : Style
topTwoColumnsWrapperStyle =
    batch
        [ alignItems flexStart
        , displayFlex
        , flexDirection column
        , flexWrap noWrap
        , justifyContent center
        , marginBottom (rem 3)
        , width (pct 100)
        , withMediaTabletPortraitUp
            [ flex (int 2)
            , flexDirection row
            , marginRight (rem 3)
            ]
        ]


pageColumnStyle : Style
pageColumnStyle =
    batch
        [ alignItems flexStart
        , displayFlex
        , flex (int 1)
        , flexDirection column
        , justifyContent center
        , marginBottom (rem 3)
        , marginRight (rem 3)
        , maxWidth (px (maxSmallDesktop / 3))
        , padding (rem 0)
        , width (pct 100)
        , lastChild
            [ marginBottom
                (rem 0)
            , marginRight (rem 0)
            ]
        , withMediaTabletPortraitUp
            [ marginBottom (rem 0)
            ]
        ]


pageColumnBlockStyle : Style
pageColumnBlockStyle =
    batch
        [ lastChild
            [ marginBottom (rem 0)
            ]
        , marginBottom (rem 4)
        , marginTop (rem 0)
        ]



-- Map
