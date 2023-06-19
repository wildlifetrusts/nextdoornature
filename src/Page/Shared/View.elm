module Page.Shared.View exposing (viewAudio, viewCallForStory, viewVideo)

import Css exposing (Style, backgroundColor, backgroundImage, backgroundPosition, backgroundRepeat, batch, color, fontWeight, int, noRepeat, padding, paddingRight, pct, rem, right, url, width)
import Html.Styled exposing (Html, a, div, h2, iframe, p, text)
import Html.Styled.Attributes exposing (attribute, autoplay, css, href, src, title)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Message exposing (Msg)
import Page.Shared.Data exposing (AudioMeta, VideoMeta)
import Route exposing (Route(..))
import Theme.Global exposing (hideFromPrint, purple, white)


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
    div [ css [ callForStoryStyle, Theme.Global.roundedCornerStyle ] ]
        [ h2 [ css [ callForStoryHeadingStyle ] ] [ text (t CallForStoryHeading) ]
        , p [] [ text (customCall ++ t CallForStoryP) ]
        , a [ href (Route.toString SubmitStory), css [ callForStoryLinkStyle ] ] [ text (t CallForStoryLinkText) ]
        ]


callForStoryStyle : Style
callForStoryStyle =
    batch
        [ backgroundColor purple
        , color white
        , padding (rem 1)
        , width (pct 100)
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


videoContainerStyle : Style
videoContainerStyle =
    batch
        []


embeddedVideoStyle : Style
embeddedVideoStyle =
    batch
        [ width (pct 100)
        , Css.property "aspect-ratio" "16 / 9"
        ]
