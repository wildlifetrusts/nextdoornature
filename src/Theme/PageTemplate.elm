module Theme.PageTemplate exposing (..)

import Css exposing (Style, batch)
import Html.Styled exposing (Html, div, main_, p, text)
import Html.Styled.Attributes exposing (css)
import Theme.FooterTemplate as FooterTemplate
import Theme.HeaderTemplate as HeaderTemplate


type alias PageInfo =
    { title : String, mainContent : String }


view : PageInfo -> Html msg
view pageInfo =
    div [ css [ defaultPageStyle ] ]
        [ HeaderTemplate.view { content = pageInfo.title }
        , main_ [ css [ mainStyle ] ]
            [ p
                []
                [ text pageInfo.mainContent
                ]
            ]
        , FooterTemplate.view
        ]


mainStyle : Style
mainStyle =
    batch
        []


defaultPageStyle : Style
defaultPageStyle =
    batch
        []
