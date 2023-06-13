module Theme.FooterTemplate exposing (view)

import Css exposing (Style, alignItems, alignSelf, auto, backgroundColor, batch, border3, borderLeft3, borderTop, center, color, column, displayFlex, em, firstChild, fitContent, flexDirection, flexEnd, flexGrow, flexShrink, flexStart, flexWrap, fontFamilies, fontSize, height, int, justifyContent, lastChild, margin, margin2, marginBottom, marginLeft, marginRight, marginTop, maxWidth, minHeight, minWidth, nthChild, padding, padding2, paddingBottom, px, rem, row, solid, spaceBetween, underline, unset, width, wrap)
import Css.Media as Media exposing (only, screen, withMedia)
import Html.Styled exposing (Html, a, div, footer, h3, img, li, nav, text, ul)
import Html.Styled.Attributes exposing (css, href, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Route exposing (Route)
import Theme.FluidScale
import Theme.Global exposing (centerContent, lightTeal, listStyleNone, purple, teal, white, withMediaMobileUp, withMediaTabletPortraitUp)


view : Language -> Route -> Html msg
view language viewRoute =
    let
        t : Key -> String
        t =
            translate language
    in
    footer
        []
        [ div [ css [ navBorderStyle ] ]
            [ nav [ css [ centerContent, footerNavStyle ] ]
                (List.map
                    (\column -> navigationColumn column language viewRoute)
                    footerNavigationContent
                )
            ]
        , div [ css [ bottomFooterOuterContainerStyle ] ]
            [ div [ css [ bottomFooterContainerStyle, centerContent ] ]
                [ div [ css [ charityInfoStyle ] ]
                    [ div [] [ text (t FooterCharityInfo) ]
                    , div [ css [ marginTop (rem 0.5) ] ] [ text (t RegisteredCharityNumber) ]
                    ]
                , div [ css [ logosContainerStyle ] ]
                    [ img [ css [ logoStyle ], src (translatedLogoPath language "logo-heritage-fund") ] []
                    , img [ css [ logoStyle ], src (translatedLogoPath language "logo-queens-platinum-jubilee") ] []
                    , img [ css [ logoStyle ], src (translatedLogoPath language "logo-wildlife-trusts") ] []
                    , div [ css [ nextdoorNatureTextStyle, logoStyle ] ] [ text (t FooterSiteLogo) ]
                    ]
                ]
            ]
        ]


translatedLogoPath : Language -> String -> String
translatedLogoPath language fileName =
    case language of
        English ->
            "/images/" ++ fileName ++ "-en.svg"

        Welsh ->
            "/images/" ++ fileName ++ "-cy.svg"


navigationColumn :
    { title : Key, links : List { text : Key, href : Key, pageSlug : Key } }
    -> Language
    -> Route
    -> Html msg
navigationColumn column language viewRoute =
    let
        t : Key -> String
        t =
            translate language

        activeNav : Key -> Style
        activeNav pageSlug =
            case viewRoute of
                Route.Page slug ->
                    if slug == String.dropLeft 1 (t pageSlug) then
                        activeLinkStyle

                    else
                        batch []

                _ ->
                    batch []
    in
    div [ css [ footerColumnListStyle ] ]
        [ h3 [ css [ Theme.FluidScale.fontSizeLarge ] ]
            [ text (t column.title)
            ]
        , nav []
            [ ul [ css [ listStyleNone ] ]
                (List.map
                    (\link ->
                        li []
                            [ a
                                [ href (t link.href)
                                , css [ activeNav link.pageSlug ]
                                ]
                                [ text (t link.text) ]
                            ]
                    )
                    column.links
                )
            ]
        ]


footerNavigationContent :
    List
        { title : Key
        , links : List { text : Key, href : Key, pageSlug : Key }
        }
footerNavigationContent =
    [ { title = FooterTitleColumnA
      , links =
            [ { text = FooterVisitWebsiteText, href = FooterVisitWebsiteLink, pageSlug = NullPage }
            , { text = FooterAboutText, href = FooterAboutLink, pageSlug = FooterAboutLink }
            , { text = FooterPrivacyPolicyText, href = FooterPrivacyPolicyLink, pageSlug = FooterPrivacyPolicyLink }
            , { text = FooterHowToUseThisSiteText, href = FooterHowToUseThisSiteLink, pageSlug = FooterHowToUseThisSiteLink }
            ]
      }
    , { title = FooterTitleColumnB
      , links = [ { text = FooterGuidesLinkText, href = FooterGuidesLink, pageSlug = NullPage } ]
      }
    , { title = FooterTitleColumnC
      , links =
            [ { text = FooterFindYourLocalTrustText, href = FooterFindYourLocalTrustLink, pageSlug = NullPage }
            ]
      }
    ]


footerColumnListStyle : Style
footerColumnListStyle =
    batch
        [ alignSelf flexStart
        , displayFlex
        , flexGrow (int 0)
        , flexShrink (int 1)
        , maxWidth (rem 20)
        , marginRight (rem 2)
        , marginBottom (rem 1)
        , flexDirection column
        , lastChild
            [ marginRight (rem 0)
            , marginBottom (rem 0)
            ]
        ]


footerNavStyle : Style
footerNavStyle =
    batch
        [ displayFlex
        , flexDirection column
        , flexWrap wrap
        , justifyContent center
        , margin auto
        , minHeight fitContent
        , paddingBottom (rem 4)
        , width (rem 20)
        , withMediaMobileUp
            [ flexDirection row
            , justifyContent spaceBetween
            , width auto
            ]
        ]


bottomFooterOuterContainerStyle : Style
bottomFooterOuterContainerStyle =
    batch
        [ backgroundColor purple
        , color white
        ]


navBorderStyle : Style
navBorderStyle =
    batch
        [ border3 (rem 0.5) solid teal
        , borderTop (rem 0)
        , backgroundColor lightTeal
        ]


bottomFooterContainerStyle : Style
bottomFooterContainerStyle =
    batch
        [ alignItems center
        , displayFlex
        , flexDirection column
        , justifyContent spaceBetween
        , withMediaTabletPortraitUp
            [ alignItems flexStart
            , flexDirection row

            -- must be higher than cookie banner button
            , paddingBottom (rem 3)
            ]
        ]


logoStyle : Style
logoStyle =
    batch
        [ height (px 90)
        , margin2 (rem 1) (rem 0)
        , padding2 (rem 0) (rem 2)
        , width (rem 11)
        , withMediaMobileUp
            [ borderLeft3 (px 1) solid white
            , firstChild
                [ borderLeft3 (px 1) solid purple
                ]
            , nthChild "3"
                [ borderLeft3 (px 1) solid purple
                , withMedia [ only screen [ Media.minWidth (px 1139) ] ]
                    [ borderLeft3 (px 1) solid white
                    ]
                ]
            ]
        ]


charityInfoStyle : Style
charityInfoStyle =
    batch
        [ marginLeft (rem 2)
        , marginRight (rem 3)
        , marginTop (rem 1)
        , maxWidth (rem 32)
        , withMediaTabletPortraitUp
            [ marginLeft (rem 0)
            , minWidth (rem 17)
            , width (rem 17)
            ]
        ]


logosContainerStyle : Style
logosContainerStyle =
    batch
        [ alignItems center
        , displayFlex
        , flexDirection row
        , flexWrap wrap
        , justifyContent center
        , maxWidth (rem 40)
        , padding (rem 2)
        , withMediaTabletPortraitUp
            [ justifyContent flexEnd
            , maxWidth unset
            , padding (rem 0)
            , width auto
            ]
        , withMediaMobileUp
            [ paddingBottom (rem 1)
            ]
        ]


nextdoorNatureTextStyle : Style
nextdoorNatureTextStyle =
    batch
        [ fontFamilies [ "Ludicrous" ]
        , fontSize (rem 3)
        , width (px 250)
        , Css.lineHeight (em 1)
        ]


activeLinkStyle : Style
activeLinkStyle =
    batch
        [ Css.textDecoration underline
        ]
