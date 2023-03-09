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

        FooterFindOutMoreText ->
            "[cCc] 🌳🌲🌳🌳🌳🌲🦊🌲🌳🌳🌲"

        FooterFindOutMoreLink ->
            "[cCc]"

        FooterHowToText ->
            "[cCc] 🌳🌲🌳🌳🌳🌲🦊🌲🌳🌳🌲"

        FooterHowToLink ->
            "[cCc]"

        FooterExploreAlphabeticallyText ->
            "[cCc] 🌳🌲🌳🌳🌳🌲🦊🌲🌳🌳🌲"

        FooterExploreAlphabeticallyLink ->
            "[cCc]"

        FooterRegionalHighlightsText ->
            "[cCc] 🌳🌲🌲🌳🌳🌲🐿️🌳🌲🌳🌳"

        FooterRegionalHighlightsLink ->
            "[cCc]"

        FooterSiteMapText ->
            "[cCc] 🌳🌲🌲🌳🌳🌲🐿️🌳🌲🌳🌳"

        FooterSiteMapLink ->
            "[cCc]"

        FooterSubmitCaseStudyText ->
            "[cCc] 🌳🌲🌳🌳🌳🌲🦊🌲🌳🌳🌲"

        FooterSubmitCaseStudyLink ->
            "[cCc]"

        FooterShareInfoText ->
            "[cCc] 🌳🌲🌲🌳🌳🌲🐿️🌳🌲🌳🌳"

        FooterShareInfoLink ->
            "[cCc]"

        FooterFindYourLocalTrustText ->
            "[cCc] 🌳🌲🌲🌳🌳🌲🐿️🌳🌲🌳🌳"

        FooterFindYourLocalTrustLink ->
            --[cCc]
            "https://www.wildlifetrusts.org/wildlife-trusts"
