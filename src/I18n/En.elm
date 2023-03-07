module I18n.En exposing (enStrings)

import I18n.Keys exposing (Key(..))


enStrings : Key -> String
enStrings key =
    case key of
        IntroText ->
            "[cCc] Init template"
                
        SiteTitle ->
            "Team Wilder"
                
        ChangeLanguage ->
            "Switch to Welsh"
