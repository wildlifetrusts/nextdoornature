module I18n.En exposing (enStrings)

import I18n.Keys exposing (Key(..))


enStrings : Key -> String
enStrings key =
    case key of
        SiteTitle ->
            "The Nextdoor Nature Hub"

        SearchMetaDescription ->
            "[cCc] Description for the guides search page"

        CallForStoryP ->
            " If you would like to submit a case study like this we would love to hear from you [cCc]"

        ---
        -- Header
        ---
        ChangeLanguage ->
            "Newid i'r Gymraeg"

        ---
        -- 404 content
        ---
        ResourceNotFoundTitle ->
            "Oops!"

        ResourceNotFoundText ->
            "Looks like we've popped up on the wrong page!"

        ResourceNotFoundLinkText ->
            "[cCc] Back to home page"

        ResourceNotFoundLinkPath ->
            "/"

        ---
        -- Footer
        ---
        FooterTitleColumnA ->
            "Find out more"

        FooterTitleColumnB ->
            "Explore this hub"

        FooterGuidesLinkText ->
            "Explore our guides"

        FooterGuidesLink ->
            "/search#guides"

        FooterStoriesLink ->
            "/search#stories"

        FooterStoriesLinkText ->
            "Explore our stories [cCc]"

        FooterTitleColumnC ->
            "Get involved"

        FooterVisitWebsiteText ->
            "Visit the Wildlife Trusts' website"

        FooterVisitWebsiteLink ->
            "https://www.wildlifetrusts.org/"

        FooterAboutText ->
            "Find out more about this project"

        FooterAboutLink ->
            "/about"

        FooterFindYourLocalTrustText ->
            "Find your local Trust"

        FooterFindYourLocalTrustLink ->
            "https://www.wildlifetrusts.org/wildlife-trusts"

        FooterShareYourStoryText ->
            "Share your story"

        FooterShareYourStoryLink ->
            --[cCc]
            "/share-story"

        HeritageFundLogoAlt ->
            "Logo for the national lottery heritage fund"

        PlatiJubesLogoAlt ->
            "Logo for the queens platinum jubilee 2022"

        WildLifeTrustLogoAlt ->
            "Logo for the wildlife trust"

        FooterPrivacyPolicyText ->
            "Privacy policy"

        FooterPrivacyPolicyLink ->
            "/privacy-policy"

        FooterHowToUseThisSiteText ->
            "How to use this site"

        FooterHowToUseThisSiteLink ->
            "/how-to-use-this-site"

        FooterSiteLogo ->
            "Nextdoor Nature"

        FooterCharityInfo ->
            "The Nextdoor Nature Hub is a project by The Wildlife Trusts and funded by The National Lottery Heritage Fund"

        RegisteredCharityNumber ->
            "Registered charity number 207238"

        ---
        -- Cookie banner
        ---
        CookieBannerH2 ->
            "Are you ok to proceed with all cookies and data?"

        CookieBannerP ->
            """
            Our website uses cookies and data to make sure you have the best experience and to help us fundraise efficiently to save wildlife. Some cookies are essential to make our website work.
            """

        CookieAcceptButtonText ->
            "Ok, got it"

        CookieDeclineButtonText ->
            "Use only essential cookies"

        CookieSettingsButtonText ->
            "Cookie settings"

        ---
        -- Index page
        ---
        WelcomeP1 ->
            "Nextdoor Nature is bringing communities together to help nature flourish where you live and work!"

        GuideHighlightsSubtitle ->
            "Guide highlights"

        StoryHighlightsSubtitle ->
            "Story highlights"

        CallForStoryHeading ->
            "Share your story"

        HomeCallForStoryP ->
            "[cCc] Have you done something great for nature in your community? What challenges or hurdles did you overcome?"

        CallForStoryLinkText ->
            "Send us your story"

        ---
        -- Guide Page
        ---
        RelatedGuidesHeading ->
            "Related guides"

        RelatedStoriesHeading ->
            "Related stories"

        GuidePrintHeader ->
            "Printable version"

        GuideVideoHeader ->
            "[cCc] Video guide"

        GuideAudioHeader ->
            "[cCc] Audio guide"

        GuideTextHeader ->
            "[cCc] Text guide"

        GuidePrintHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-print.svg"

        GuideVideoHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-video.svg"

        GuideAudioHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-audio.svg"

        GuideTextHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-text.svg"

        GuideButtonText ->
            "Click here"

        GuideParagraphText ->
            "for a printable version of this page, which you can easily share with groups or anyone who does not have digital access"

        ---
        -- Search Page
        ---
        SearchTitle ->
            "Search"

        SearchTitleFiltered num query ->
            num ++ " guides on '" ++ query ++ "' [cCc]"

        SearchPlaceholder ->
            "Search this hub"

        ExploreGuidesListHeading ->
            "Explore guides by topic"

        ---
        -- Story Page
        ---
        WhereSubHeading ->
            "Where"

        WhoSubHeading ->
            "Who"

        ---
        -- SubmitStory Page
        ---
        SubmitFormSrc ->
            "https://teamwildertest.formstack.com/forms/teamwilder_test"

        SubmitFormTitle ->
            "teamwilder_test"

        SubmitFormHeading ->
            "Your details"

        SubmitStoryMetaImageLink ->
            "/images/submit-meta-david-clode-eL4ADAsiOR8-unsplash.jpg"

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
            "[cCc] Topic "

        ---
        -- Metadata
        ---
        StoryMetaDescription title ->
            "[cCc] A story about: " ++ title

        StoryMetaDescriptionWithAuthor author title ->
            "[cCc] A story about " ++ author ++ ": " ++ title
