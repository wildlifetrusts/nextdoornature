module I18n.Cy exposing (cyStrings)

import I18n.Keys exposing (Key(..))


cyStrings : Key -> String
cyStrings key =
    case key of
        SiteTitle ->
            "[cCc] Hwb Natur Drws-nesaf"

        ResourceNotFoundTitle ->
            "[cCc] Oops! CY"

        ResourceNotFoundText ->
            "[cCc] Looks like we've popped up on the wrong page CY"

        ResourceNotFoundLinkText ->
            "[cCc] Back to home page CY"

        ResourceNotFoundLinkPath ->
            "/"

        GuidesTitle ->
            "[cCc] Guides CY"

        GuidesMetaDescription ->
            "[cCc] Guides Description in Welsh"

        GuidesTitleFiltered num query ->
            num ++ " CY guides on '" ++ query ++ "' [cCc]"

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
            "[cCc] Natur Drws-nesaf"

        SearchPlaceholder ->
            "[cCc] Cy label"

        _ ->
            "[cCc] [fFf] to reminder to add all Welsh Keys back"
