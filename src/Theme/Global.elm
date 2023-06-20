module Theme.Global exposing (borderWrapper, centerContent, contentWrapper, featureImageStyle, globalStyles, hideFromPrint, lightTeal, listStyleNone, maxTabletPortrait, pageColumnStyle, primaryHeader, purple, roundedCornerStyle, screenReaderOnly, teal, teaserContainerStyle, teaserImageStyle, teaserRowStyle, topTwoColumnsWrapperStyle, white, withMediaDesktopUp, withMediaMobileUp, withMediaPrint, withMediaTabletLandscapeUp, withMediaTabletPortraitUp)

import Css exposing (Color, Style, absolute, alignItems, auto, backgroundColor, backgroundImage, backgroundPosition, backgroundRepeat, backgroundSize, batch, border, border3, borderBottomRightRadius, borderRadius4, borderTopLeftRadius, borderTopRightRadius, boxSizing, breakWord, center, cm, color, column, contain, contentBox, cover, cursor, display, displayFlex, em, ex, flex, flex3, flexDirection, flexStart, flexWrap, fontFamilies, height, hex, hidden, hover, inherit, inlineBlock, int, justifyContent, lastChild, left, listStyle, margin, margin2, margin3, marginBottom, marginLeft, marginRight, marginTop, maxWidth, minWidth, noRepeat, noWrap, none, overflow, overflowWrap, padding, padding2, paddingLeft, pct, pointer, position, property, pseudoElement, px, rem, row, solid, textDecoration, textDecoration3, top, underline, url, width, zero)
import Css.Global exposing (global, typeSelector)
import Css.Media as Media exposing (only, print, screen, withMedia)
import Html.Styled exposing (Html, h1, text)
import Html.Styled.Attributes exposing (id, tabindex)
import Theme.FluidScale



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


withMediaDesktopUp : List Style -> Style
withMediaDesktopUp =
    withMedia [ only screen [ Media.minWidth (px maxSmallDesktop) ] ]


basePrintStyles : List Style
basePrintStyles =
    [ backgroundColor white
    , color black
    , border (px 0)
    , overflowWrap breakWord
    ]


withMediaPrint : Maybe (List Style) -> Style
withMediaPrint styles =
    withMedia [ only print [] ] <|
        basePrintStyles
            ++ Maybe.withDefault [] styles


hideFromPrint : Style
hideFromPrint =
    withMedia [ only print [] ] [ display none ]



-- Colours


purple : Color
purple =
    hex "54257F"


lightPurple : Color
lightPurple =
    hex "AA92bf"


teal : Color
teal =
    hex "058295"


lightTeal : Color
lightTeal =
    hex "e7f2f4"


white : Color
white =
    hex "ffffff"


black : Color
black =
    hex "000000"



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
        [ borderRadius4 (rem roundedCornerValue) (rem roundedCornerValue) (rem roundedCornerValue) (rem 0)
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
            , withMediaPrint Nothing
            ]
        , typeSelector "h1"
            [ fontFamilies [ "Adelle", "serif" ]
            , color purple
            , hover [ textDecoration none ]
            , margin3 (rem 0) (rem 0) (rem 1.5)
            , textDecoration none
            , Theme.FluidScale.fontSizeExtraLarge
            , width (pct 100)
            , withMediaPrint Nothing
            ]
        , typeSelector "h2"
            [ fontFamilies [ "Adelle", "serif" ]
            , color purple
            , hover [ textDecoration none ]
            , margin3 (rem 0) (rem 0) (rem 1.5)
            , textDecoration none
            , Theme.FluidScale.fontSizeLarge
            , width (pct 100)
            , withMediaPrint Nothing
            ]
        , typeSelector "h3"
            [ fontFamilies [ "Adelle", "serif" ]
            , color purple
            , hover [ textDecoration none ]
            , margin3 (rem 0) (rem 0) (rem 1)
            , textDecoration none
            , Theme.FluidScale.fontSizeMedium
            , withMediaPrint Nothing
            ]
        , typeSelector "h4"
            [ fontFamilies [ "Adelle", "serif" ]
            , color purple
            , hover [ textDecoration none ]
            , margin3 (rem 0) (rem 0) (rem 1)
            , textDecoration none
            , Theme.FluidScale.fontSizeBase
            , withMediaPrint Nothing
            ]
        , typeSelector "a"
            [ color purple
            , textDecoration3 underline solid lightPurple
            , hover
                [ textDecoration3 underline solid purple
                ]
            , withMediaPrint
                (Just
                    [ textDecoration underline
                    , pseudoElement "after"
                        [ Css.property "content" """ " (" attr(href) ")" """
                        , backgroundImage none
                        , minWidth (pct 100)
                        ]
                    ]
                )
            ]
        , typeSelector "b"
            []
        , typeSelector "p"
            [ margin3 (rem 0) (rem 0) (rem 1)
            ]
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
        , typeSelector "@page"
            [ margin (cm 1.5) ]
        ]



-- Helpers


primaryHeader : List (Html.Styled.Attribute msg) -> String -> Html msg
primaryHeader extraAttributes title =
    h1 ([ id "focus-target", tabindex -1 ] ++ extraAttributes) [ text title ]


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


featureImageStyle : Style
featureImageStyle =
    batch
        [ height auto
        , roundedCornerStyle
        , teaserRowStyle
        , width (pct 100)
        ]


teaserImageStyle : Style
teaserImageStyle =
    batch
        [ backgroundRepeat noRepeat
        , backgroundPosition center
        , backgroundSize cover
        , property "aspect-ratio" "1/1"
        , property "object-fit" "cover"
        , roundedCornerStyle
        , width (pct 100)
        , marginBottom (rem 1)
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
        , property "gap" "1rem"
        , width (pct 100)
        , withMediaTabletLandscapeUp
            [ alignItems flexStart
            , flexDirection row
            , property "gap" "3rem"
            ]
        , withMediaTabletPortraitUp
            [ property "gap" "2rem"
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
        , justifyContent center
        , property "gap" "1rem"
        , width (pct 100)
        , withMediaTabletLandscapeUp
            [ property "gap" "3rem"
            ]
        , withMediaTabletPortraitUp
            [ flex (int 2)
            , flexDirection row
            , property "gap" "2rem"
            ]
        ]


columnWidthStyle : Style
columnWidthStyle =
    batch
        [ withMediaTabletPortraitUp
            [ minWidth (px (maxTabletPortrait / 3.6))
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
        , property "gap" "1rem"
        , width (pct 100)
        ]


borderWrapper : Style
borderWrapper =
    batch
        [ border3 (rem 0.5) solid teal
        ]
