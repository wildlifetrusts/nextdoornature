module I18n.Cy exposing (cyStrings)

import I18n.Keys exposing (Key(..))


cyStrings : Key -> String
cyStrings key =
    case key of
        SiteTitle ->
            "Hwb Natur Drws Nesaf"

        GuidesMetaDescription ->
            ""

        ---
        -- Header
        ---
        ChangeLanguage ->
            "Newid i Gymraeg"

        ---
        -- 404 content
        ---
        ResourceNotFoundTitle ->
            ""

        ResourceNotFoundText ->
            ""

        ResourceNotFoundLinkText ->
            ""

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
            --[cCc]
            "https://www.wildlifetrusts.org/"

        FooterAboutText ->
            "Mwy o wybodaeth am y prosiect yma"

        FooterAboutLink ->
            "/about"

        FooterFindYourLocalTrustText ->
            "Dod o hyd i’ch Ymddiriedolaeth leol"

        FooterFindYourLocalTrustLink ->
            --[cCc]
            "https://www.wildlifetrusts.org/wildlife-trusts"

        FooterPrivacyPolicyText ->
            "Polisi preifatrwydd"

        FooterPrivacyPolicyLink ->
            "/privacy-policy"

        FooterHowToUseThisSiteText ->
            ""

        FooterHowToUseThisSiteLink ->
            "/how-to-use-this-site"

        FooterSiteLogo ->
            "Natur Drws Nesaf"

        FooterCharityInfo ->
            "Mae Hwb Natur Drws Nesaf yn brosiect gan yr Ymddiriedolaethau Natur ac mae wedi’i gyllido gan Gronfa Dreftadaeth y Loteri Genedlaethol"

        RegisteredCharityNumber ->
            "Rhif elusen gofrestredig 20723"

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
            ""

        WelcomeP2 ->
            ""

        WelcomeP3 ->
            ""

        GuideHighlightsSubtitle ->
            "Uchafbwyntiau’r canllawiau"

        StoryHighlightsSubtitle ->
            "Uchafbwyntiau'r straeon"

        CallForStoryHeading ->
            "Rhannwch eich stori!"

        CallForStoryP ->
            ""

        CallForStoryLinkText ->
            ""

        ---
        -- Guide Page
        ---
        RelatedGuidesHeading ->
            "Canllawiau cysylltiedig"

        RelatedStoriesHeading ->
            "Straeon cysylltiedig"

        GuidePrintHeader ->
            ""

        GuideVideoHeader ->
            ""

        GuideAudioHeader ->
            ""

        GuideTextHeader ->
            ""

        GuidePrintHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-print.svg"

        GuideVideoHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-video.svg"

        GuideAudioHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-audio.svg"

        GuideTextHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-text.svg"

        GuideButtonText ->
            ""

        GuideParagraphText ->
            ""

        ---
        -- Guides Page
        ---
        GuidesTitle ->
            "Canllawiau"

        GuidesTitleFiltered num query ->
            num ++ " guides on '" ++ query ++ "' [cCc]"

        SearchPlaceholder ->
            "Chwilio’r hwb yma"

        ExploreGuidesListPlaceholder ->
            "Archwilio’r canllawiau yn ôl pwnc"

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
            ""

        CategoryPublicityEventsName ->
            ""

        CategoryWorkingWithPeopleName ->
            ""

        CategoryWorkingWithAuthoritiesName ->
            ""

        InCategory ->
            ""

        _ ->
            "[cCc] [fFf] to reminder to add all Welsh Keys back"
