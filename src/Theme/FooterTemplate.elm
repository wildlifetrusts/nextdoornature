module Theme.FooterTemplate exposing (view)

import Css exposing (Style, backgroundColor, batch, column, displayFlex, em, fitContent, flexDirection, flexShrink, flexWrap, justifyContent, margin2, minHeight, pct, row, spaceAround, width, wrap, zero)
import Html.Styled exposing (Html, a, div, footer, h3, img, p, text)
import Html.Styled.Attributes exposing (css, href, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
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
        , margin2 (em 2) zero
        ]
