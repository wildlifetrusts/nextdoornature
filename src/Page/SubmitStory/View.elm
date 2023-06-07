module Page.SubmitStory.View exposing (..)

import Html.Styled exposing (Html, iframe)
import Html.Styled.Attributes as Attr
import I18n.Translate exposing (Language(..))
import Message exposing (Msg)
import Shared exposing (Model)


view : Model -> Html Msg
view model =
    case model.language of
        English ->
            iframe
                [ Attr.src "https://teamwildertest.formstack.com/forms/teamwilder_test"
                , Attr.title "teamwilder_test"
                , Attr.width 600
                , Attr.height 1000
                ]
                []

        Welsh ->
            -- this would need to be a seperate welsh form
            iframe
                [ Attr.src "https://teamwildertest.formstack.com/forms/teamwilder_test"
                , Attr.title "teamwilder_test"
                , Attr.width 600
                , Attr.height 1000
                ]
                []
