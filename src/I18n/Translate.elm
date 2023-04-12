module I18n.Translate exposing (Language(..), languageToString, translate)

import I18n.Cy exposing (cyStrings)
import I18n.En exposing (enStrings)
import I18n.Keys exposing (Key)


type Language
    = English
    | Welsh


languageToString : Language -> String
languageToString language =
    case language of
        English ->
            "English"

        Welsh ->
            "Welsh"


translate : Language -> Key -> String
translate language key =
    let
        translator : Key -> String
        translator =
            case language of
                English ->
                    enStrings

                Welsh ->
                    cyStrings
    in
    translator key
