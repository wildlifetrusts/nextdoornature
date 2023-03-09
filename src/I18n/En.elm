module I18n.En exposing (enStrings)

import I18n.Keys exposing (Key(..))


enStrings : Key -> String
enStrings key =
    case key of
        PageTitle ->
            "[cCc] Init template"

        SiteTitle ->
            "[cCc] Team Wilder"

        CaseStudyTitle ->
            "[cCc] Case Study"

        ResourceTitle ->
            "[cCc] Resource"

        ChangeLanguage ->
            "[cCc] Switch to Welsh"

        --- Footer
        FooterTitleColumnA ->
            "[cCc] Find out more"

        FooterTitleColumnB ->
            "[cCc] Explore the library"

        FooterTitleColumnC ->
            "[cCc] Get involved"

        FooterVisitWebsiteText ->
            "[cCc] Visit the Wildlife Trusts' main website"

        FooterVisitWebsiteLink ->
            --[cCc]
            "https://www.wildlifetrusts.org/"

        FooterFindOutMoreText ->
            "[cCc] Find out more about this project"

        FooterFindOutMoreLink ->
            "[cCc]"

        FooterHowToText ->
            "[cCc] How to use this website"

        FooterHowToLink ->
            "[cCc]"

        FooterExploreAlphabeticallyText ->
            "[cCc] Explore the guides alphabetically by subject"

        FooterExploreAlphabeticallyLink ->
            "[cCc]"

        FooterRegionalHighlightsText ->
            "[cCc] Regional highlights and seasonal highlights (homepage)"

        FooterRegionalHighlightsLink ->
            "[cCc]"

        FooterSiteMapText ->
            "[cCc] Full site map"

        FooterSiteMapLink ->
            "[cCc]"

        FooterSubmitCaseStudyText ->
            "[cCc] Submit your own case study"

        FooterSubmitCaseStudyLink ->
            "[cCc]"

        FooterShareInfoText ->
            "[cCc] SHare information / highlight an error"

        FooterShareInfoLink ->
            "[cCc]"

        FooterFindYourLocalTrustText ->
            "[cCc] Find your local trust"

        FooterFindYourLocalTrustLink ->
            --[cCc]
            "https://www.wildlifetrusts.org/wildlife-trusts"
