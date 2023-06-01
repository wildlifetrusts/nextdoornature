module Theme.Global exposing (borderWrapper, centerContent, contentWrapper, featureImageStyle, globalStyles, lightTeal, listStyleNone, pageColumnBlockStyle, pageColumnStyle, purple, roundedCornerStyle, teal, teaserContainerStyle, teaserImageStyle, teaserRowStyle, teasersContainerStyle, topTwoColumnsWrapperStyle, white, withMediaMobileUp, withMediaTabletPortraitUp)

import Css exposing (Color, Style, alignItems, auto, backgroundImage, backgroundPosition, backgroundRepeat, backgroundSize, batch, border3, borderBottomRightRadius, borderTopLeftRadius, borderTopRightRadius, boxSizing, center, color, column, contain, contentBox, cover, cursor, display, displayFlex, em, ex, flex, flex3, flexDirection, flexStart, flexWrap, fontFamilies, height, hex, hidden, inherit, inlineBlock, int, justifyContent, lastChild, listStyle, margin, margin2, margin3, marginBottom, marginLeft, marginRight, marginTop, maxWidth, minWidth, noRepeat, noWrap, none, overflow, padding, padding2, paddingLeft, pct, pointer, property, pseudoElement, px, rem, row, solid, spaceBetween, textDecoration, url, width, wrap, zero)
import Css.Global exposing (global, typeSelector)
import Css.Media as Media exposing (only, screen, withMedia)
import Html.Styled exposing (Html)
import Theme.FluidScale



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


withMediaDesktopUp : List Style -> Style
withMediaDesktopUp =
    withMedia [ only screen [ Media.minWidth (px maxSmallDesktop) ] ]



-- Colours


purple : Color
purple =
    hex "54257F"


teal : Color
teal =
    hex "058295"


lightTeal : Color
lightTeal =
    hex "e7f2f4"


white : Color
white =
    hex "ffffff"



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
            , margin3 (rem 0) auto (rem 2)
            , Theme.FluidScale.fontSize4
            , width (pct 100)
            ]
        , typeSelector "h2"
            [ fontFamilies [ "Adelle", "serif" ]
            , color purple
            , Theme.FluidScale.fontSize3
            ]
        , typeSelector "h3"
            [ fontFamilies [ "Adelle", "serif" ]
            , color purple
            , Theme.FluidScale.fontSize2
            ]
        , typeSelector "h4"
            [ fontFamilies [ "Adelle", "serif" ]
            , color purple
            , Theme.FluidScale.fontSize1
            ]
        , typeSelector "a"
            [ color purple
            , textDecoration none
            , pseudoElement "after"
                [ backgroundImage
                    (url "/images/arrow.svg")
                , backgroundSize contain
                , backgroundPosition center
                , backgroundRepeat noRepeat
                , display inlineBlock
                , property "content" "' '"
                , height (ex 1.5)
                , width (em 1.0)
                , marginLeft (em 0.3)
                ]
            ]
        , typeSelector "b"
            []
        , typeSelector "p"
            []
        , typeSelector "blockquote"
            []
        , typeSelector "button"
            [ fontFamilies [ "Rubik", "sans-serif" ]
            , color purple
            , cursor pointer
            ]
        , typeSelector ".content_image"
            [ borderTopLeftRadius (rem roundedCornerValue)
            , borderTopRightRadius (rem roundedCornerValue)
            , borderBottomRightRadius (rem roundedCornerValue)
            , overflow hidden
            , width (pct 100)
            ]
        ]



-- Helpers


listStyleNone : Style
listStyleNone =
    batch
        [ listStyle none
        , paddingLeft zero
        ]


teaserContainerStyle : Style
teaserContainerStyle =
    batch
        [ alignItems flexStart
        , displayFlex
        , flex3 (int 1) (int 1) (pct 20)
        , flexDirection column
        , listStyle none
        , marginRight (rem 1.5)
        , marginBottom (rem 1.5)
        , maxWidth (px 180)
        , minWidth (px 120)
        , width (pct 100)
        , lastChild
            [ marginBottom (rem 0)
            , marginRight (rem 0)
            ]
        , withMediaTabletPortraitUp
            [ flex3 (int 1) (int 1) (pct 34)
            , minWidth (px 100)
            ]
        ]


teaserRowStyle : Style
teaserRowStyle =
    batch
        [ margin (rem 0)
        , marginBottom
            (rem 0.5)
        , width inherit
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
        , justifyContent spaceBetween
        , margin (rem 0)
        , padding (rem 0)
        , width auto
        , withMediaTabletPortraitUp
            [ justifyContent flexStart
            ]
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
        [ backgroundRepeat noRepeat
        , backgroundPosition center
        , backgroundSize cover
        , maxWidth (px (maxMobile / 3))
        , property "aspect-ratio" "1/1"
        , property "object-fit" "cover"
        , width (pct 100)
        ]


centerContent : Style
centerContent =
    batch
        [ alignItems center
        , boxSizing contentBox
        , displayFlex
        , flexDirection column
        , margin auto
        , maxWidth (px maxSmallDesktop)
        , margin2 (rem 0) auto
        , padding (rem 1)
        , width auto
        , withMediaTabletPortraitUp
            [ padding2 (rem 1) (rem 3)
            ]
        ]


contentWrapper : Style
contentWrapper =
    batch
        [ alignItems center
        , displayFlex
        , flexDirection column
        , flexWrap noWrap
        , justifyContent center
        , withMediaTabletLandscapeUp
            [ alignItems flexStart
            , flexDirection row
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
        , width auto
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
        [ withMediaTabletPortraitUp
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
        , width (pct 100)
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


borderWrapper : Style
borderWrapper =
    batch
        [ border3 (rem 0.5) solid teal
        ]
