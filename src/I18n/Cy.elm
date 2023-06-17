module I18n.Cy exposing (cyStrings)

import I18n.Keys exposing (Key(..))


cyStrings : Key -> String
cyStrings key =
    case key of
        SiteTitle ->
            "Hwb Natur Drws Nesaf"

        ---
        -- Header
        ---
        ChangeLanguage ->
            "Newid i Saesneg"

        ---
        -- 404 content
        ---
        ResourceNotFoundTitle ->
            "[cCc]"

        ResourceNotFoundText ->
            "[cCc]"

        ResourceNotFoundLinkText ->
            "[cCc]"

        ResourceNotFoundLinkPath ->
            "/"

        ---
        -- Footer
        ---
        FooterTitleColumnA ->
            "Mwy o wybodaeth"

        FooterTitleColumnB ->
            "Archwilio’r hwb yma"

        FooterGuidesLinkText ->
            "Archwilio ein canllawiau"

        FooterGuidesLink ->
            "/guides"

        FooterTitleColumnC ->
            "Cymryd rhan"

        FooterVisitWebsiteText ->
            "Mynd i wefan yr Ymddiriedolaethau Natur"

        FooterVisitWebsiteLink ->
            "https://www.wildlifetrusts.org/"

        FooterAboutText ->
            "Mwy o wybodaeth am y prosiect yma"

        FooterAboutLink ->
            "/about"

        FooterFindYourLocalTrustText ->
            "Dod o hyd i’ch Ymddiriedolaeth leol"

        FooterFindYourLocalTrustLink ->
            "https://www.wildlifetrusts.org/wildlife-trusts"

        FooterPrivacyPolicyText ->
            "Polisi preifatrwydd"

        FooterPrivacyPolicyLink ->
            "/privacy-policy"

        FooterHowToUseThisSiteText ->
            "[cCc]"

        FooterHowToUseThisSiteLink ->
            "/how-to-use-this-site"

        FooterSiteLogo ->
            "Natur Drws Nesaf"

        FooterShareYourStoryText ->
            "Rhannwch eich stori!"

        FooterCharityInfo ->
            "Mae Hwb Natur Drws Nesaf yn brosiect gan yr Ymddiriedolaethau Natur ac mae wedi’i gyllido gan Gronfa Dreftadaeth y Loteri Genedlaethol"

        RegisteredCharityNumber ->
            "Rhif elusen gofrestredig 207238"

        ---
        -- Cookie banner
        ---
        CookieBannerH2 ->
            "Ydych chi’n iawn i fwrw ymlaen gyda'r holl gwcis a data?"

        CookieBannerP ->
            """
            Mae ein gwefan ni’n defnyddio cwcis a data i wneud yn siŵr eich bod yn cael y profiad gorau ac i'n helpu ni i godi arian yn effeithlon i achub bywyd gwyllt. Mae rhai cwcis yn hanfodol i wneud i'n gwefan ni weithio.
            """

        CookieAcceptButtonText ->
            "Iawn, rydw i’n deall"

        CookieDeclineButtonText ->
            "Dim Diolch"

        CookieSettingsButtonText ->
            "Gosodiadau cwcis"

        ---
        -- Index page
        ---
        HomeTitle ->
            "Croeso i Hwb Natur Drws Nesaf"

        WelcomeP1 ->
            "[cCc]"

        WelcomeP2 ->
            "[cCc]"

        WelcomeP3 ->
            "[cCc]"

        GuideHighlightsSubtitle ->
            "Uchafbwyntiau’r canllawiau"

        StoryHighlightsSubtitle ->
            "Uchafbwyntiau'r straeon"

        CallForStoryHeading ->
            "Rhannwch eich stori!"

        CallForStoryP ->
            "[cCc]"

        CallForStoryLinkText ->
            "[cCc]"

        ---
        -- Guide Page
        ---
        RelatedGuidesHeading ->
            "Canllawiau cysylltiedig"

        RelatedStoriesHeading ->
            "Straeon cysylltiedig"

        GuidePrintHeader ->
            "[cCc]"

        GuideVideoHeader ->
            "[cCc]"

        GuideAudioHeader ->
            "[cCc]"

        GuideTextHeader ->
            "[cCc]"

        GuidePrintHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-print.svg"

        GuideVideoHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-video.svg"

        GuideAudioHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-audio.svg"

        GuideTextHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-text.svg"

        GuideButtonText ->
            "[cCc]"

        GuideParagraphText ->
            "[cCc]"

        ---
        -- Guides Page
        ---
        SearchTitle ->
            "Canllawiau"

        SearchMetaDescription ->
            "[cCc] Search page description in Welsh"

        SearchTitleFiltered num query ->
            num ++ " guides on '" ++ query ++ "' [cCc]"

        SearchPlaceholder ->
            "Chwilio’r hwb yma"

        ---
        -- Story Page
        ---
        WhereSubHeading ->
            "Ble"

        WhoSubHeading ->
            "Pwy"

        ---
        -- Category things
        ---
        CategoryAdminAndInfoName ->
            "[cCc]"

        CategoryPublicityEventsName ->
            "[cCc]"

        CategoryWorkingWithPeopleName ->
            "[cCc]"

        CategoryWorkingWithAuthoritiesName ->
            "[cCc]"

        InCategory ->
            "[cCc]"

        ---
        -- SubmitStory Page
        ---
        SubmitStoryMetaImageLink ->
            "/images/submit-meta-david-clode-eL4ADAsiOR8-unsplash.jpg"

        _ ->
            "[cCc] [fFf] to reminder to add all Welsh Keys back"
