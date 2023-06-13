module I18n.En exposing (enStrings)

import I18n.Keys exposing (Key(..))


enStrings : Key -> String
enStrings key =
    case key of
        SiteTitle ->
            "The Nextdoor Nature Hub"

        GuidesMetaDescription ->
            "[cCc] Description for the guides search page"

        ---
        -- Header
        ---
        ChangeLanguage ->
            "[cCc] Switch to Welsh"

        ---
        -- 404 content
        ---
        ResourceNotFoundTitle ->
            "[cCc] Oops!"

        ResourceNotFoundText ->
            "[cCc] Looks like we've popped up on the wrong page"

        ResourceNotFoundLinkText ->
            "[cCc] Back to home page"

        ResourceNotFoundLinkPath ->
            "/"

        ---
        -- Footer
        ---
        FooterTitleColumnA ->
            "[cCc] Find out more"

        FooterTitleColumnB ->
            "[cCc] Explore the hub"

        FooterGuidesLinkText ->
            "[cCc] Browse our guides"

        FooterGuidesLink ->
            "/guides"

        FooterTitleColumnC ->
            "[cCc] Get involved"

        FooterVisitWebsiteText ->
            "[cCc] Visit the Wildlife Trusts' main website"

        FooterVisitWebsiteLink ->
            --[cCc]
            "https://www.wildlifetrusts.org/"

        FooterAboutText ->
            "Find out more about this project"

        FooterAboutLink ->
            "/about"

        FooterFindYourLocalTrustText ->
            "[cCc] Find your local trust"

        FooterFindYourLocalTrustLink ->
            --[cCc]
            "https://www.wildlifetrusts.org/wildlife-trusts"

        FooterPrivacyPolicyText ->
            "Privacy Policy"

        FooterPrivacyPolicyLink ->
            "/privacy-policy"

        FooterHowToUseThisSiteText ->
            "[cCc] How to use this site"

        FooterHowToUseThisSiteLink ->
            "/how-to-use-this-site"

        NullPage ->
            ""

        FooterSiteLogo ->
            "Nextdoor Nature"

        FooterCharityInfo ->
            "[cCc] The Nextdoor Nature hub is a project by the Wildlife Trusts: Protecting Wildlife for the Future"

        RegisteredCharityNumber ->
            "Registered charity number 20723"

        ---
        -- Cookie banner
        ---
        CookieBannerH2 ->
            "Are you ok to proceed with all cookies and data?"

        CookieBannerP ->
            """
            [cCc] Our website uses cookies and data to make sure you have the best experience and to help us fundraise efficiently to save wildlife. Some cookies are essential to make our website work.
            """

        CookieAcceptButtonText ->
            "Okay, got it"

        CookieDeclineButtonText ->
            "No thanks"

        CookieSettingsButtonText ->
            "Cookie settings"

        ---
        -- Index page
        ---
        HomeTitle ->
            "Welcome to the nextdoor nature hub"

        WelcomeP1 ->
            "[cCc] Nextdoor Nature is an initiative launched by the Wilidlife Trusts in 2022. (Read more here) The aim of Nextdoor Nature is to equip everyone with the skills and knowledge they need to make a positive difference for nature - in their own area, and beyond."

        WelcomeP2 ->
            "[cCc] With the climate and environmental crisis ever worsining, it's important to recognise that there are actions all of us can take that can meaniningfully make a difference. It's easy to feel powerless, but in fact, together we are powerful!"

        WelcomeP3 ->
            "[cCc] The goal of Nextdoor Nature is to get at least 1 in 4 people across the UK taking Action for Nature. This hub aims to support anyone who is interested in finding out what they can do, and how they can get other people involved."

        GuideHighlightsSubtitle ->
            "Guide highlights"

        StoryHighlightsSubtitle ->
            "Story highlights"

        CallForStoryHeading ->
            "Share your story"

        CallForStoryP ->
            "[cCc] Have done something great for nature in your community? We would love to share your experience to help others, including any challenges you faced or hurdles you had to overcome."

        CallForStoryLinkText ->
            "Send us your story"

        ---
        -- Guide Page
        ---
        RelatedGuidesHeading ->
            "Related Guides"

        RelatedStoriesHeading ->
            "Real Stories"

        ---
        -- Guides Page
        ---
        GuidesTitle ->
            "Guides"

        GuidesTitleFiltered num query ->
            num ++ " guides on '" ++ query ++ "' [cCc]"

        SearchPlaceholder ->
            "Search the hub"

        ExploreGuidesListPlaceholder ->
            "[cCc] Explore guides by theme"

        ---
        -- Story Page
        ---
        WhereSubHeading ->
            "Where"

        WhoSubHeading ->
            "Who"

        ---
        -- Category things
        ---
        CategoryAdminAndInfoName ->
            "Community Groups - Admin and Information"

        CategoryPublicityEventsName ->
            "Media, Publicity and Events"

        CategoryWorkingWithPeopleName ->
            "Working with People"

        CategoryWorkingWithAuthoritiesName ->
            "Working with the Authorities"

        InCategory ->
            "[cCc] In category "
