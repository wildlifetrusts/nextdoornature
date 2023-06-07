module Page.SubmitStory.View exposing (..)

import Html.Styled exposing (Html, button, form, input, label, p, text, textarea)
import Html.Styled.Attributes as Attr
import Message exposing (Msg)
import Shared exposing (Model)


view : Model -> Html Msg
view model =
    form [ Attr.action "" ]
        [ label [ Attr.for "" ]
            [ p [] [ text "Where are you?" ]
            , p [] [ text "(First part of postcode - we will not share your exact location)" ]
            , input [ Attr.type_ "text" ] []
            ]
        , label [ Attr.for "" ]
            [ p [] [ text "Who are you?" ]
            , p [] [ text " (Tell us the individual or group name you'd like us to add to your case study. e.g. 'Emma from York', 'Southwalk Girl Guides') " ]
            , input [ Attr.type_ "text" ] []
            ]
        , label [ Attr.for "" ]
            [ p [] [ text "What did you do?" ]
            , p [] [ text "(Tell us about your project 300 - 1000 words) ..." ]
            , textarea [ Attr.name "", Attr.id "", Attr.cols 30, Attr.rows 10 ] []
            ]
        , label [ Attr.for "" ]
            [ p [] [ text "Share images" ]
            , p [] [ text "We usually only publish case studies with images..." ]
            , input [ Attr.type_ "file" ] []
            ]
        , label [ Attr.for "" ]
            [ p [] [ text "Your email" ]
            , p [] [ text " (So we can contact you wth any questions and to let you know if we publish your story) " ]
            , input [ Attr.type_ "email" ] []
            ]
        , label [ Attr.for "" ]
            [ p [] [ text "Your phone number" ]
            , p [] [ text "(optional - please enter if you would prefer us to give you a ring)" ]
            , input [ Attr.type_ "tel" ] []
            ]
        , button [] [ text "Submit my story" ]
        ]
