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
            "Switch to Welsh"

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
            "Find out more"

        FooterTitleColumnB ->
            "Explore this hub"

        FooterGuidesLinkText ->
            "Explore our guides"

        FooterGuidesLink ->
            "/guides"

        FooterTitleColumnC ->
            "Get involved"

        FooterVisitWebsiteText ->
            "Visit the Wildlife Trusts' website"

        FooterVisitWebsiteLink ->
            --[cCc]
            "https://www.wildlifetrusts.org/"

        FooterAboutText ->
            "Find out more about this project"

        FooterAboutLink ->
            "/about"

        FooterFindYourLocalTrustText ->
            "Find your local Trust"

        FooterFindYourLocalTrustLink ->
            --[cCc]
            "https://www.wildlifetrusts.org/wildlife-trusts"

        FooterShareYourStoryText ->
            "[cCc] Share your story"

        FooterShareYourStoryLink ->
            --[cCc]
            "/submit-story"

        FooterPrivacyPolicyText ->
            "Privacy policy"

        FooterPrivacyPolicyLink ->
            "/privacy-policy"

        FooterHowToUseThisSiteText ->
            "[cCc] How to use this site"

        FooterHowToUseThisSiteLink ->
            "/how-to-use-this-site"

        FooterSiteLogo ->
            "Nextdoor Nature"

        FooterCharityInfo ->
            "The Nextdoor Nature Hub is a project by The Wildlife Trusts and funded by The National Lottery Heritage Fund"

        RegisteredCharityNumber ->
            "Registered charity number 20723"

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
        HomeTitle ->
            "Welcome to the Nextdoor Nature Hub"

        WelcomeP1 ->
            "Nextdoor Nature is bringing communities together to help nature flourish where you live and work!"

        WelcomeP2 ->
            "Thanks to £5million funding from The National Lottery Heritage Fund, Nextdoor Nature provides you with the advice and support you need to help nature on your doorstep, and leave a lasting natural legacy to mark The Queen’s Platinum Jubilee."

        WelcomeP3 ->
            "The guides on this Hub give you simple, straightforward information so you can take action for nation. And the stories are where you can find inspiration - and share your own experiences!"

        GuideHighlightsSubtitle ->
            "Guide highlights"

        StoryHighlightsSubtitle ->
            "Story highlights"

        CallForStoryHeading ->
            "Share your story!"

        CallForStoryP ->
            "[cCc] Have done something great for nature in your community? We would love to share your experience to help others, including any challenges you faced or hurdles you had to overcome."

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
            "Printable verison"

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
            "[cCc] In category "

        ---
        -- Metadata
        ---
        StoryMetaDescription title ->
            "[cCc] A story about: " ++ title

        StoryMetaDescriptionWithAuthor author title ->
            "[cCc] A story about " ++ author ++ ": " ++ title
