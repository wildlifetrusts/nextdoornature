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
            "If you want to tell us your story, we'd love to hear from you."

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
            "Back to home page"

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

        FooterStoriesLinkText ->
            "Explore our stories"

        FooterTitleColumnC ->
            "Get involved"

        FooterVisitWebsiteText ->
            "Visit the Wildlife Trusts' website"

        FooterAboutText ->
            "Find out more about this project"

        FooterFindYourLocalTrustText ->
            "Find your local Trust"

        FooterShareYourStoryText ->
            "Share your story"

        HeritageFundLogoAlt ->
            "Logo for the national lottery heritage fund"

        PlatiJubesLogoAlt ->
            "Logo for the queens platinum jubilee 2022"

        WildLifeTrustLogoAlt ->
            "Logo for the wildlife trust"

        FooterPrivacyPolicyText ->
            "Privacy policy"

        FooterHowToUseThisSiteText ->
            "How to use this site"

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
            "No thanks"

        CookieSettingsButtonText ->
            "Cookie settings"

        ---
        -- Index page
        ---
        IndexMetaDescription ->
            "Nextdoor Nature is bringing communities together to help nature flourish where you live and work!"

        GuideHighlightsSubtitle ->
            "Guide highlights"

        StoryHighlightsSubtitle ->
            "Story highlights"

        CallForStoryHeading ->
            "Share your story"

        HomeCallForStoryP ->
            "Have you done something great for nature in your community? What challenges did you overcome?"

        CallForStoryLinkText ->
            "Send us your story"

        HomeYoutubeLink ->
            "https://youtube.com/embed/5n-L1HUg_3E"

        HomeVideoTitle ->
            "Tash from Northumberland tells us how we can all take action for nature"

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
            "Video guide"

        GuideAudioHeader ->
            "Audio guide"

        GuideTextHeader ->
            "Text guide"

        GuidePrintHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-print.svg"

        GuideVideoHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-video.svg"

        GuideAudioHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-audio.svg"

        GuideTextHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-text.svg"

        GuideButtonText ->
            "Click here for a printable version of this guide,"

        GuideParagraphText ->
            "which you can easily share with groups or anyone who does not have digital access"

        ---
        -- Search Page
        ---
        SearchTitle ->
            "Search"

        SearchTitleFiltered num query ->
            num ++ " guides on " ++ query

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
        SubmitStoryMetaImageLink ->
            "/images/submit-meta-david-clode-eL4ADAsiOR8-unsplash.jpg"

        SubmitFormSrc ->
            "https://teamwildertest.formstack.com/forms/teamwilder_test"

        SubmitFormTitle ->
            "[cCc] teamwilder_test"

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

        ---
        -- Metadata
        ---
        StoryMetaDescription title ->
            "A story about: " ++ title

        StoryMetaDescriptionWithAuthor author title ->
            "A story about " ++ author ++ ": " ++ title
