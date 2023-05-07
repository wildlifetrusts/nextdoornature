module Page.Shared.View exposing (viewAudio, viewVideo)

import Css exposing (Style, absolute, batch, height, left, paddingBottom, pct, position, relative, top, width, zero)
import Html.Styled exposing (Html, a, div, iframe, img, li, p, text, ul)
import Html.Styled.Attributes exposing (alt, attribute, autoplay, css, href, src, title)
import Json.Decode exposing (Decoder)
import List exposing (map, sortBy)
import Message exposing (Msg)
import Page.Shared.Data
import String exposing (length, padRight)
import Theme.Global exposing (roundedCornerStyle, teaserContainerStyle, teaserImageStyle, teaserRowStyle, teasersContainerStyle)


viewVideo : Page.Shared.Data.VideoMeta -> Html Msg
viewVideo videoMeta =
    div [ css [ videoContainerStyle ] ]
        [ iframe
            [ src videoMeta.src
            , attribute "frameborder" "0"
            , attribute "allowfullscreen" "true"
            , autoplay False
            , title videoMeta.title
            , css [ embeddedVideoStyle ]
            ]
            []
        ]


viewAudio : Page.Shared.Data.AudioMeta -> Html Msg
viewAudio _ =
    div
        [ css [ embeddedVideoStyle ]
        ]
        [ text "[fFf] render audio player" ]


embeddedVideoStyle : Style
embeddedVideoStyle =
    batch
        [ height (pct 100)
        , left zero
        , position absolute
        , top zero
        , width (pct 100)
        ]


videoContainerStyle : Style
videoContainerStyle =
    batch
        [ paddingBottom (pct 56.25)
        , position relative
        , width (pct 100)
        ]
