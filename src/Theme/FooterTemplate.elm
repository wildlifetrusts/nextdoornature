module Theme.FooterTemplate exposing (view)

import Css exposing (Style, alignItems, backgroundColor, batch, center, color, column, display, displayFlex, em, fitContent, flexDirection, flexEnd, flexShrink, flexWrap, height, hex, inlineBlock, justifyContent, margin2, minHeight, padding, pct, property, px, rem, row, spaceAround, width, wrap, zero)
import Html.Styled exposing (Html, a, div, footer, h3, img, p, text)
import Html.Styled.Attributes exposing (css, href, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)


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
            [ img [ css [ logoStyle ], src "/images/logo-heritage-fund.svg" ] []
            , div [ css [ logoPartitionStyle ] ] []
            , img [ css [ logoStyle ], src "/images/logo-queens-platinum-jubilee.svg" ] []
            , div [ css [ logoPartitionStyle ] ] []
            , img [ css [ logoStyle ], src "/images/logo-wildlife-trusts.svg" ] []
            , div [ css [ logoPartitionStyle ] ] []
            , img [ css [ logoStyle ], src "/images/logo-nextdoor-nature-footer.svg" ] []
            ]
        ]


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
        , div [] (List.map (\link -> a [ href (t link.href) ] [ text (t link.text) ]) column.links)
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


footerContainerStyle : Style
footerContainerStyle =
    batch
        [ displayFlex
        , flexDirection row
        , flexWrap wrap
        , justifyContent spaceAround
        , minHeight fitContent
        ]


footerStyle : Style
footerStyle =
    batch
        [ flexShrink zero
        , width (pct 100)
        , margin2 (em 2) zero
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
