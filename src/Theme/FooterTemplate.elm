module Theme.FooterTemplate exposing (view)

import Css exposing (Style, batch, column, displayFlex, em, fitContent, flexDirection, flexShrink, flexWrap, int, justifyContent, marginBottom, marginTop, minHeight, pct, px, row, spaceAround, width, wrap)
import Html.Styled exposing (Html, a, div, footer, h2, h3, img, p, text)
import Html.Styled.Attributes exposing (css, href, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Shared exposing (Model, Msg(..))


view : Language -> Html msg
view language =
    let
        t : Key -> String
        t =
            translate language
    in
    footer [ css [ footerStyle ] ]
        [ div []
            [ p [] [ text (t FooterProjectInfo) ]
            , img [ src "/images/wildlife-trust-logo.png" ] []
            ]
        , div [ css [ navigationContainerStyle ] ]
            (List.map
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
    div [ css [ navigationColumnStyle ] ]
        [ h3 []
            [ text (t column.title)
            ]
        , div [ css [ navigationColumnContentsStyle ] ] (List.map (\link -> a [ href (t link.href) ] [ text (t link.text) ]) column.links)
        ]


footerNavigationContent : List { title : Key, links : List { text : Key, href : Key } }
footerNavigationContent =
    [ { title = FooterTitleColumnA
      , links =
            [ { text = FooterVisitWebsiteText, href = FooterVisitWebsiteLink }
            ]
      }
    , { title = FooterTitleColumnB
      , links = []
      }
    , { title = FooterTitleColumnC
      , links =
            [ { text = FooterFindYourLocalTrustText, href = FooterFindYourLocalTrustLink }
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
