module Theme.FooterTemplate exposing (view)

import Css exposing (Style, batch, column, displayFlex, em, fitContent, flexDirection, flexShrink, flexWrap, int, justifyContent, marginBottom, marginTop, minHeight, pct, px, row, spaceAround, width, wrap)
import Html.Styled exposing (Html, a, div, footer, h3, text)
import Html.Styled.Attributes exposing (css, href)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)


view : Language -> Html msg
view language =
    footer [ css [ footerStyle ] ]
        [ div [ css [ navigationContainerStyle ] ]
            (List.map
                (\column -> navigationColumn column language)
                footerTitles
            )
        ]


navigationColumn : { title : Key, links : List { text : Key, href : Key } } -> Language -> Html msg
navigationColumn column language =
    let
        t : Key -> String
        t =
            translate language
    in
    div [ css [ navigationColumnStyle ] ]
        [ h3 []
            [ text (t column.title)
            ]
        , div [ css [ navigationColumnContentsStyle ] ] (List.map (\link -> a [ href (t link.href) ] [ text (t link.text) ]) column.links)
        ]


footerTitles : List { title : Key, links : List { text : Key, href : Key } }
footerTitles =
    [ { title = FooterTitleColumnA
      , links =
            [ { text = FooterVisitWebsiteText, href = FooterVisitWebsiteLink }
            , { text = FooterFindOutMoreText, href = FooterFindOutMoreLink }
            , { text = FooterHowToText, href = FooterHowToLink }
            ]
      }
    , { title = FooterTitleColumnB
      , links =
            [ { text = FooterExploreAlphabeticallyText, href = FooterExploreAlphabeticallyLink }
            , { text = FooterRegionalHighlightsText, href = FooterRegionalHighlightsLink }
            , { text = FooterSiteMapText, href = FooterSiteMapLink }
            ]
      }
    , { title = FooterTitleColumnC
      , links =
            [ { text = FooterFindYourLocalTrustText, href = FooterFindYourLocalTrustLink }
            , { text = FooterSubmitCaseStudyText, href = FooterSubmitCaseStudyLink }
            , { text = FooterShareInfoText, href = FooterShareInfoLink }
            ]
      }
    ]


navigationColumnStyle : Style
navigationColumnStyle =
    batch
        [ marginTop (em 2)
        , width (px 280)
        ]


navigationColumnContentsStyle : Style
navigationColumnContentsStyle =
    batch
        [ displayFlex
        , flexDirection column
        ]


navigationContainerStyle : Style
navigationContainerStyle =
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
        [ flexShrink (int 0)
        , width (pct 100)
        , marginBottom (em 2)
        ]
