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
            "Switch to English"

        ---
        -- 404 content
        ---
        ResourceNotFoundTitle ->
            "Wps!"

        ResourceNotFoundText ->
            "Mae'n edrych fel ein bod ni wedi ymddangos ar y dudalen anghywir!"

        ResourceNotFoundLinkText ->
            "Ewch yn ôl i'r dudalen gartref"

        ResourceNotFoundLinkPath ->
            "/"

        ---
        -- Footer
        ---
        FooterTitleColumnA ->
            "Mwy o wybodaeth"

        FooterTitleColumnB ->
            "Archwilio'r hwb yma"

        FooterGuidesLinkText ->
            "Archwilio ein canllawiau"

        FooterTitleColumnC ->
            "Cymryd rhan"

        FooterVisitWebsiteText ->
            "Mynd i wefan yr Ymddiriedolaethau Natur"

        FooterAboutText ->
            "Mwy o wybodaeth am y prosiect yma"

        FooterFindYourLocalTrustText ->
            "Dod o hyd i'ch Ymddiriedolaeth leol"

        FooterPrivacyPolicyText ->
            "Polisi preifatrwydd"

        FooterHowToUseThisSiteText ->
            "Sut i ddefnyddio'r wefan hon"

        FooterSiteLogo ->
            "Natur Drws Nesaf"

        FooterShareYourStoryText ->
            "Rhannwch eich stori!"

        FooterStoriesLinkText ->
            "Archwilio ein straeon"

        FooterCharityInfo ->
            "Mae Hwb Natur Drws Nesaf yn brosiect gan yr Ymddiriedolaethau Natur ac mae wedi'i gyllido gan Gronfa Dreftadaeth y Loteri Genedlaethol"

        RegisteredCharityNumber ->
            "Rhif elusen gofrestredig 207238"

        HeritageFundLogoAlt ->
            "Logo for the national lottery heritage fund"

        PlatiJubesLogoAlt ->
            "Logo for the queens platinum jubilee 2022"

        WildLifeTrustLogoAlt ->
            "Logo for the wildlife trust"

        ---
        -- Cookie banner
        ---
        CookieBannerH2 ->
            "Ydych chi'n iawn i fwrw ymlaen gyda'r holl gwcis a data?"

        CookieBannerP ->
            "Mae ein gwefan ni'n defnyddio cwcis a data i wneud yn siŵr eich bod yn cael y profiad gorau ac i'n helpu ni i godi arian yn effeithlon i achub bywyd gwyllt. Mae rhai cwcis yn hanfodol i wneud i'n gwefan ni weithio.\n"

        CookieAcceptButtonText ->
            "Iawn, rydw i'n deall"

        CookieDeclineButtonText ->
            "Dim Diolch"

        CookieSettingsButtonText ->
            "Gosodiadau cwcis"

        ---
        -- Index page
        ---
        IndexMetaDescription ->
            "[cCc]"

        GuideHighlightsSubtitle ->
            "Uchafbwyntiau'r canllawiau"

        StoryHighlightsSubtitle ->
            "Uchafbwyntiau'r straeon"

        CallForStoryHeading ->
            "Rhannwch eich stori!"

        CallForStoryP ->
            "Os ydych chi eisiau dweud eich stori wrthym, byddem wrth ein bodd yn clywed gennych."

        CallForStoryLinkText ->
            "Anfonwch eich stori atom"

        HomeCallForStoryP ->
            "Ydych chi wedi gwneud rhywbeth gwych dros natur yn eich cymuned? Pa heriau wnaethoch chi eu goresgyn?"

        HomeYoutubeLink ->
            "https://youtube.com/embed/5n-L1HUg_3E"

        HomeVideoTitle ->
            "Tash from Northumberland tells us how we can all take action for nature"

        ---
        -- Guide Page
        ---
        RelatedGuidesHeading ->
            "Canllawiau cysylltiedig"

        RelatedStoriesHeading ->
            "Straeon cysylltiedig"

        GuidePrintHeader ->
            "Fersiwn argraffadwy"

        GuideVideoHeader ->
            "Canllaw fideo"

        GuideAudioHeader ->
            "Canllaw sain"

        GuideTextHeader ->
            "Canllaw testun"

        GuidePrintHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-print.svg"

        GuideVideoHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-video.svg"

        GuideAudioHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-audio.svg"

        GuideTextHeaderIconLink ->
            "/images/icons/NextDoorNature_icons-text.svg"

        GuideButtonText ->
            "Cliciwch yma am fersiwn argraffadwy o'r canllaw hwn"

        GuideParagraphText ->
            ""

        ---
        -- Guides Page
        ---
        SearchTitle ->
            "Canllawiau"

        SearchMetaDescription ->
            "[cCc] Search page description in Welsh"

        SearchTitleFiltered num query ->
            num ++ " canllawiau ar " ++ query

        SearchPlaceholder ->
            "Chwilio'r hwb yma"

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
            "Grwpiau Cymunedol – Gweinyddol a Gwybodaeth"

        CategoryPublicityEventsName ->
            "Cyfryngau, Cyhoeddusrwydd a Digwyddiadau"

        CategoryWorkingWithPeopleName ->
            "Gweithio gyda Phobl"

        CategoryWorkingWithAuthoritiesName ->
            "Gweithio gyda'r Awdurdodau"

        ---
        -- SubmitStory Page
        ---
        SubmitStoryMetaImageLink ->
            "/images/submit-meta-david-clode-eL4ADAsiOR8-unsplash.jpg"

        SubmitStoryFormSrc ->
            "[cCc]"

        SubmitStoryFormTitle ->
            "[cCc]"

        StoryMetaDescription title ->
            "Stori am: " ++ title

        StoryMetaDescriptionWithAuthor author title ->
            "Stori am " ++ author ++ ": " ++ title

        ExploreGuidesListHeading ->
            "Archwilio'r canllawiau yn ôl pwnc"
