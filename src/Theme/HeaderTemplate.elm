module Theme.HeaderTemplate exposing (view)

import Css exposing (Style, batch, fontFamilies, fontSize, margin, rem, zero)
import Html.Styled exposing (Html, a, h6, header, text)
import Html.Styled.Attributes exposing (css, href)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Shared exposing (Model)


view : Model -> Html msg
view model =
    let
        t : Key -> String
        t =
            translate model.language
    in
    header [ css [ headerStyle ] ]
        [ h6 [ css [ headerBrandStyle ] ]
            [ a [ href "/" ]
                [ text (t SiteTitle)
                ]
            ]
        ]


headerStyle : Style
headerStyle =
    batch
        []


headerBrandStyle : Style
headerBrandStyle =
    batch
        [ fontSize (rem 4)
        , fontFamilies [ "Ludicrous" ]
        , margin zero
        ]
