module Page.Shared.View exposing (viewAudio, viewCallForStory, viewVideo)

import Css exposing (Style, absolute, backgroundColor, backgroundImage, backgroundPosition, backgroundRepeat, batch, color, fontWeight, height, int, left, margin2, margin3, noRepeat, padding, paddingBottom, paddingRight, pct, position, relative, rem, right, top, url, width, zero)
import Html.Styled exposing (Html, a, div, h2, iframe, p, text)
import Html.Styled.Attributes exposing (attribute, autoplay, css, href, src, title)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Message exposing (Msg)
import Page.Shared.Data
import Theme.Global exposing (hideFromPrint, purple, roundedCornerStyle, white, withMediaTabletLandscapeUp, withMediaTabletPortraitUp)


viewVideo : Page.Shared.Data.VideoMeta -> Html Msg
viewVideo videoMeta =
    div []
        [ if String.length videoMeta.description > 0 then
            p [] [ text videoMeta.description ]

          else
            text ""
        , div [ css [ videoContainerStyle, hideFromPrint ] ]
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
        ]


viewAudio : Page.Shared.Data.AudioMeta -> Html Msg
viewAudio _ =
    div
        [ css [ embeddedVideoStyle, hideFromPrint ]
        ]
        [ text "[fFf] render audio player" ]


viewCallForStory : Language -> String -> Html Msg
viewCallForStory language customCall =
    let
        t : Key -> String
        t =
            translate language
    in
    div [ css [ callForStoryStyle ] ]
        [ h2 [ css [ callForStoryHeadingStyle ] ] [ text (t CallForStoryHeading) ]
        , p [] [ text (customCall ++ t CallForStoryP) ]
        , a [ href "submit story Route [cCc]", css [ callForStoryLinkStyle ] ] [ text (t CallForStoryLinkText) ]
        ]


callForStoryStyle : Style
callForStoryStyle =
    batch
        [ backgroundColor purple
        , color white
        , margin2 (rem 0) (rem 0)
        , padding (rem 1)
        , roundedCornerStyle
        , width (pct 100)
        , withMediaTabletPortraitUp
            [ margin3 (rem 0) (rem 0) (rem 2)
            ]
        ]


callForStoryHeadingStyle : Style
callForStoryHeadingStyle =
    color white


callForStoryLinkStyle : Style
callForStoryLinkStyle =
    batch
        [ backgroundImage (url "/images/arrow--white.svg")
        , backgroundPosition right
        , backgroundRepeat noRepeat
        , color white
        , fontWeight (int 500)
        , paddingRight (rem 1.5)
        ]


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
