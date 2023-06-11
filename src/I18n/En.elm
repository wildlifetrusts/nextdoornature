module I18n.En exposing (enStrings)

import I18n.Keys exposing (Key(..))


enStrings : Key -> String
enStrings key =
    case key of
        SiteTitle ->
            "The Nextdoor Nature Hub"

        ---
        -- Header
        ---
        ChangeLanguage ->
            "[cCc] Switch to Welsh"

        ---
        -- 404 content
        ---
        Guide404Title ->
            "[cCc] Sorry, we can't find that guide"

        Guide404Slug ->
            "guide-not-found"

        Guide404Body ->
            "[cCc] Try searching again [home](\"\\\")"

        Story404Title ->
            "[cCc] Sorry, we can't find that story"

        Story404Body ->
            "[cCc] Try searching again [home](\"\\\")"

        AncillaryPage404Title ->
            "[cCc] Sorry, we can't find that page"

        AncillaryPage404Slug ->
            "page-not-found"

        AncillaryPage404Body ->
            "[cCc] Try searching again [home](\"\\\")"

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

        FooterShareYourStoryText ->
            "[cCc] Share your story"

        FooterShareYourStoryLink ->
            --[cCc]
            "/submit-story"

        FooterPrivacyPolicyText ->
            "Privacy Policy"

        FooterPrivacyPolicyLink ->
            "/privacy-policy"

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
            "[cCc] Guides"

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
        SubmitStoryHeading ->
            "Share your story!"

        SubmitStoryP1 ->
            """
            Have you been inspired to take action for nature in your area? Tell everyone about it here! Your project can be small or large, finished or ongoing. You can give contact details or you can keep the location very vague and just say "Yorkshire" or "Salisbury". The most important thing is to share the useful information that will help others. What went well? What mistakes did you learn from?
"""

        SubmitStoryP2 ->
            """
          By sending us your story, you are consenting to making it public on this website. You must make sure that everyone in the photo has agreed to this. Do not send us anything that is private. We might edit your text to make it fit. By sending us your story, you are agreeing to let us contact you about this story, but you can opt out of contact at any time. If you have any questions about how your data is stored, how to opt out, and what we do with your data, please see our Privacy policy or email nextdoornature@wildlifetrusts.org
          """

        SubmitFormSrc ->
            "https://teamwildertest.formstack.com/forms/teamwilder_test"

        SubmitFormTitle ->
            "teamwilder_test"

        SubmitFormHeading ->
            "Your details"
