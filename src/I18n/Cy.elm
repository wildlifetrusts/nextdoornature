module I18n.Cy exposing (cyStrings)

import I18n.Keys exposing (Key(..))


cyStrings : Key -> String
cyStrings key =
    case key of
        PageTitle ->
            "[cCc] Init template CY"

        SiteTitle ->
            "[cCc] Team Wilder CY"

        CaseStudyTitle ->
            "[cCc] Case Study CY"

        ResourceTitle ->
            "[cCc] Resource CY"

        ChangeLanguage ->
            "[cCc] Switch to English"
