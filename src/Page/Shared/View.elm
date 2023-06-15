module Page.Shared.View exposing (viewAudio, viewBreadcrumbs, viewCallForStory, viewVideo)

import Css exposing (Style, absolute, backgroundColor, backgroundImage, backgroundPosition, backgroundRepeat, batch, color, fontWeight, height, int, left, noRepeat, padding, paddingBottom, paddingRight, pct, position, relative, rem, right, top, url, width, zero)
import Html.Styled exposing (Html, a, div, h2, iframe, p, span, text)
import Html.Styled.Attributes exposing (attribute, autoplay, css, href, src, title)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Message exposing (Msg)
import Page.Shared.Data
import Theme.Global exposing (hideFromPrint, purple, white)


viewVideo : Page.Shared.Data.VideoMeta -> Html Msg
viewVideo videoMeta =
    div [ css [ videoContainerStyle, hideFromPrint ] ]
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
        , a [ href "submit story Route [cCc]", css [ callForStoryLinkStyle ] ] [ text (t CallForStoryLinkText) ]
        ]


viewBreadcrumbs : List { text : String, href : String } -> Html Msg
viewBreadcrumbs crumbs =
    div [ css [ breadcrumbStyle ] ]
        (List.map
            (\link ->
                if String.length link.href > 0 then
                    a [ css [ breadcrumbLink ], href link.href ] [ text link.text ]

                else
                    span [ css [ breadcrumbFinal ] ] [ text link.text ]
            )
            crumbs
        )


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


breadcrumbStyle : Style
breadcrumbStyle =
    batch
        [ Css.marginBottom (rem 1)
        ]


breadcrumbLink : Style
breadcrumbLink =
    batch
        [ Css.marginRight (rem 0.5)
        ]


breadcrumbFinal : Style
breadcrumbFinal =
    batch
        [ color purple
        , fontWeight Css.bold
        ]
