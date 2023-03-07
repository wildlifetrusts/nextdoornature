module I18n.Cy exposing (cyStrings)

import I18n.Keys exposing (Key(..))


cyStrings : Key -> String
cyStrings key =
    case key of
        IntroText ->
            "[cCc] Init template CY"
                
        SiteTitle ->
            "Team Wilder CY"
                
        ChangeLanguage ->
            "Switch to English"
