module Theme.Global exposing (centerContent, embeddedAudioStyle, embeddedVideoStyle, featureImageStyle, globalStyles, lightTeal, mainContainerStyles, outerPadding, pageColumnBlockStyle, pageColumnStyle, purple, roundedCornerStyle, teal, teaserContainerStyle, teaserImageStyle, teaserRowStyle, teasersContainerStyle, topTwoColumnsWrapperStyle, withMediaMobileUp)

import Css exposing (Color, Style, absolute, alignItems, auto, batch, borderBottomRightRadius, borderTopLeftRadius, borderTopRightRadius, boxSizing, center, color, column, contentBox, displayFlex, flex, flex3, flexDirection, flexStart, flexWrap, fontFamilies, height, hex, hidden, int, justifyContent, lastChild, left, listStyle, margin, marginBottom, marginLeft, marginRight, marginTop, maxWidth, minWidth, noWrap, none, overflow, padding, padding2, pct, position, px, rem, row, spaceBetween, top, width, wrap, zero)
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


maxTabletPortrait : Float
maxTabletPortrait =
    900


maxTabletLandscape : Float
maxTabletLandscape =
    1200


maxSmallDesktop : Float
maxSmallDesktop =
    1500


withMediaMobileUp : List Style -> Style
withMediaMobileUp =
    withMedia [ only screen [ Media.minWidth (px maxMobile) ] ]


withMediaTabletPortraitUp : List Style -> Style
withMediaTabletPortraitUp =
    withMedia [ only screen [ Media.minWidth (px maxTabletPortrait) ] ]


withMediaTabletLandscapeUp : List Style -> Style
withMediaTabletLandscapeUp =
    withMedia [ only screen [ Media.minWidth (px maxTabletLandscape) ] ]



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


roundedCornerStyle : Style
roundedCornerStyle =
    batch
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
        , typeSelector ".content_image"
            [ borderTopLeftRadius (rem roundedCornerValue)
            , borderTopRightRadius (rem roundedCornerValue)
            , borderBottomRightRadius (rem roundedCornerValue)
            , overflow hidden
            ]
        ]



-- Helpers


teaserContainerStyle : Style
teaserContainerStyle =
    batch
        [ alignItems flexStart
        , displayFlex
        , flex3 (int 1) (int 1) (pct 34)
        , flexDirection column
        , listStyle none
        , marginRight (rem 1.5)
        , marginBottom (rem 1.5)
        , minWidth (px 200)
        , width (pct 100)
        , lastChild
            [ marginBottom (rem 0)
            , marginRight (rem 0)
            ]
        , withMediaTabletPortraitUp
            [ minWidth (px 100)
            ]
        ]


teaserRowStyle : Style
teaserRowStyle =
    batch
        [ margin (rem 0)
        , marginBottom
            (rem 0.5)
        , lastChild
            [ marginBottom (rem 0)
            ]
        ]


teasersContainerStyle : Style
teasersContainerStyle =
    batch
        [ alignItems flexStart
        , displayFlex
        , flexDirection row
        , flexWrap wrap
        , margin (rem 0)
        , padding (rem 0)
        , width (pct 100)
        ]


featureImageStyle : Style
featureImageStyle =
    batch
        [ width (pct 100)
        , height auto
        , maxWidth (px (maxSmallDesktop / 3))
        , teaserRowStyle
        ]


teaserImageStyle : Style
teaserImageStyle =
    batch
        [ width (pct 100)
        , height auto
        , maxWidth (px (maxTabletPortrait / 3))
        ]


embeddedVideoStyle : Style
embeddedVideoStyle =
    batch
        [ width (pct 100)
        , height auto
        , maxWidth (px (maxTabletLandscape / 3))
        ]


embeddedAudioStyle : Style
embeddedAudioStyle =
    batch
        [ width (pct 100)
        , height auto
        , maxWidth (px (maxTabletLandscape / 3))
        ]


outerPadding : Style
outerPadding =
    batch
        [ padding2 (rem 2) (rem 1)
        , withMediaTabletPortraitUp
            [ padding (rem 3)
            ]
        , withMediaTabletLandscapeUp
            [ padding2 (rem 4) (rem 3)
            ]
        ]


centerContent : Style
centerContent =
    batch
        [ alignItems center
        , boxSizing contentBox
        , displayFlex
        , flexDirection column
        , maxWidth (px maxSmallDesktop)
        , marginLeft auto
        , marginRight auto
        , outerPadding
        ]


mainContainerStyles : Style
mainContainerStyles =
    batch
        [ alignItems flexStart
        , displayFlex
        , flexDirection column
        , flexWrap noWrap
        , justifyContent center
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


pageColumnMarginStyle : Style
pageColumnMarginStyle =
    batch
        [ marginBottom (rem 3)
        , marginRight (rem 3)
        , lastChild
            [ marginBottom (rem 0)
            , marginRight (rem 0)
            ]
        , withMediaTabletPortraitUp
            [ marginBottom (rem 0)
            ]
        ]


columnWidthStyle : Style
columnWidthStyle =
    batch
        [ maxWidth (px (maxSmallDesktop / 3))
        , width (pct 100)
        , withMediaTabletPortraitUp
            [ minWidth (px (maxTabletPortrait / 3))
            ]
        ]


pageColumnStyle : Style
pageColumnStyle =
    batch
        [ alignItems flexStart
        , columnWidthStyle
        , displayFlex
        , flex (int 1)
        , flexDirection column
        , justifyContent center
        , pageColumnMarginStyle
        ]


pageColumnBlockStyle : Style
pageColumnBlockStyle =
    batch
        [ marginBottom (rem 4)
        , marginTop (rem 0)
        , lastChild
            [ marginBottom (rem 0)
            ]
        ]



-- Map
