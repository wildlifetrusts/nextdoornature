module I18n.Cy exposing (cyStrings)

import I18n.Keys exposing (Key(..))


cyStrings : Key -> String
cyStrings key =
    case key of
        SiteTitle ->
            "[cCc] Nextdoor Nature CY"

        GuidesTitle ->
            "[cCc] Guides CY"

        ChangeLanguage ->
            "[cCc] Switch to English"

        FooterTitleColumnA ->
            "[cCc] 🔎🔎🔎🔎🔎🔎"

        FooterTitleColumnB ->
            "[cCc] 📚📚📚📚📚📚📚"

        FooterTitleColumnC ->
            "[cCc] 🦾🦾🦾🦾🦾🦾"

        FooterVisitWebsiteText ->
            "[cCc] 🌳🌲🌲🌳🌳🌲🐿️🌳🌲🌳🌳"

        FooterVisitWebsiteLink ->
            --[cCc]
            "https://www.wildlifetrusts.org/"

        FooterFindYourLocalTrustText ->
            "[cCc] 🌳🌲🌲🌳🌳🌲🐿️🌳🌲🌳🌳"

        FooterFindYourLocalTrustLink ->
            --[cCc]
            "https://www.wildlifetrusts.org/wildlife-trusts"

        FooterSiteLogo ->
            "[cCc] Nextdoor Nature CY"

        _ ->
            "[cCc] [fFf] to reminder to add all Welsh Keys back"
