module Page.CaseStudy exposing (view)

import Html.Styled exposing (Html)
import I18n.Keys exposing (Key(..))
import Shared exposing (Model, Msg)
import Theme.PageTemplate as PageTemplate


view : Model -> Html Msg
view model =
    PageTemplate.view
        { language = model.language
        , title = CaseStudyTitle
        }
