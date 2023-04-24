module Theme.FooterTemplate exposing (view)

import Css exposing (Style, alignItems, backgroundColor, batch, bold, center, color, column, display, displayFlex, em, fitContent, flexDirection, flexEnd, flexShrink, flexWrap, fontFamilies, fontSize, fontWeight, height, hex, inlineBlock, justifyContent, margin2, marginTop, minHeight, padding, paddingBottom, pct, property, px, rem, row, spaceAround, width, wrap, zero)
import Html.Styled exposing (Html, a, br, div, footer, h3, img, p, text)
import Html.Styled.Attributes exposing (css, href, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Theme.Global exposing (lightTeal, purple, teal)


view : Language -> Html msg
view language =
    let
        t : Key -> String
        t =
            translate language
    in
    footer [ css [ footerStyle ] ]
        [ div [ css [ footerContainerStyle ] ]
            (div [ css [ footerColumnContentsStyle ] ]
                [ p [] [ text (t FooterProjectInfo) ]
                , img [ src "/images/wildlife-trust-logo.png" ] []
                ]
                :: List.map
                    (\column -> navigationColumn column language)
                    footerNavigationContent
            )
        , div [ css [ footerLogoAreaStyle ] ]
            [ img [ css [ logoStyle ], src (translatedLogoPath language "logo-heritage-fund") ] []
            , div [ css [ logoPartitionStyle ] ] []
            , img [ css [ logoStyle ], src (translatedLogoPath language "logo-queens-platinum-jubilee") ] []
            , div [ css [ logoPartitionStyle ] ] []
            , img [ css [ logoStyle ], src (translatedLogoPath language "logo-wildlife-trusts") ] []
            , div [ css [ logoPartitionStyle ] ] []
            , div [ css [ nextdoorNatureTextStyle ] ] [ text (t SiteTitle) ]
            ]
        ]


translatedLogoPath : Language -> String -> String
translatedLogoPath language fileName =
    case language of
        English ->
            "/images/" ++ fileName ++ "-en.svg"

        Welsh ->
            "/images/" ++ fileName ++ "-cy.svg"


navigationColumn : { title : Key, links : List { text : Key, href : Key } } -> Language -> Html msg
navigationColumn column language =
    let
        t : Key -> String
        t =
            translate language
    in
    div [ css [ footerColumnContentsStyle ] ]
        [ h3 []
            [ text (t column.title)
            ]
        , div [ css [ footerColumnListStyle ] ] (List.map (\link -> a [ href (t link.href) ] [ text (t link.text) ]) column.links)
        ]


footerNavigationContent :
    List
        { title : Key
        , links : List { text : Key, href : Key }
        }
footerNavigationContent =
    [ { title = FooterTitleColumnA
      , links =
            [ { text = FooterVisitWebsiteText, href = FooterVisitWebsiteLink }
            , { text = FooterPrivacyPolicyText, href = FooterPrivacyPolicyLink }
            ]
      }
    , { title = FooterTitleColumnB
      , links = [ { text = FooterGuidesLinkText, href = FooterGuidesLink } ]
      }
    , { title = FooterTitleColumnC
      , links =
            [ { text = FooterFindYourLocalTrustText, href = FooterFindYourLocalTrustLink }
            ]
      }
    ]


footerColumnContentsStyle : Style
footerColumnContentsStyle =
    batch
        [ displayFlex
        , flexDirection column
        ]


footerColumnListStyle : Style
footerColumnListStyle =
    batch
        [ displayFlex
        , flexDirection column
        ]


footerContainerStyle : Style
footerContainerStyle =
    batch
        [ displayFlex
        , flexDirection row
        , flexWrap wrap
        , justifyContent spaceAround
        , minHeight fitContent
        , backgroundColor lightTeal
        ]


footerStyle : Style
footerStyle =
    batch
        [ flexShrink zero
        , width (pct 100)
        , marginTop (rem 2)
        ]


footerLogoAreaStyle : Style
footerLogoAreaStyle =
    batch
        [ displayFlex
        , flexDirection row
        , justifyContent flexEnd
        , alignItems center
        , property "gap" "3rem" -- rowGap (Css.rem 1)
        , backgroundColor (hex "53257f")
        , color (hex "fff")
        , padding (rem 3)
        , paddingBottom (rem 5)
        ]


logoStyle : Style
logoStyle =
    batch
        [ height (px 90)
        , display inlineBlock
        ]


logoPartitionStyle : Style
logoPartitionStyle =
    batch
        [ height (px 156)
        , display inlineBlock
        , width (px 1)
        , backgroundColor (hex "fff")
        ]


nextdoorNatureTextStyle : Style
nextdoorNatureTextStyle =
    batch
        [ fontFamilies [ "Ludicrous" ]
        , fontSize (rem 3)
        , width (px 250)
        , Css.lineHeight (em 1)
        ]
