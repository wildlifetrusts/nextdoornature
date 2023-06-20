module I18n.Keys exposing (Key(..))


type Key
    = SiteTitle
    | ChangeLanguage
      --- 404 content
    | ResourceNotFoundTitle
    | ResourceNotFoundText
    | ResourceNotFoundLinkText
    | ResourceNotFoundLinkPath
      --- Footer
    | FooterTitleColumnA
    | FooterTitleColumnB
    | FooterTitleColumnC
    | FooterVisitWebsiteText
    | FooterVisitWebsiteLink
    | FooterAboutText
    | FooterAboutLink
    | FooterGuidesLinkText
    | FooterGuidesLink
    | FooterStoriesLink
    | FooterStoriesLinkText
    | FooterFindYourLocalTrustText
    | FooterFindYourLocalTrustLink
    | FooterShareYourStoryText
    | FooterShareYourStoryLink
    | FooterPrivacyPolicyText
    | FooterPrivacyPolicyLink
    | FooterHowToUseThisSiteText
    | FooterHowToUseThisSiteLink
    | FooterSiteLogo
    | FooterCharityInfo
    | RegisteredCharityNumber
    | HerritageFundLogoAlt
    | PLatiJubesLogoAlt
    | WildLifeTrustLogoAlt
      --- Cookie banner
    | CookieBannerH2
    | CookieBannerP
    | CookieAcceptButtonText
    | CookieDeclineButtonText
    | CookieSettingsButtonText
      --- Index Page
    | WelcomeP1
    | GuideHighlightsSubtitle
    | StoryHighlightsSubtitle
    | CallForStoryHeading
    | HomeCallForStoryP
    | CallForStoryP
    | CallForStoryLinkText
      --- Guide Page
    | RelatedGuidesHeading
    | RelatedStoriesHeading
    | GuidePrintHeader
    | GuideVideoHeader
    | GuideAudioHeader
    | GuideTextHeader
    | GuidePrintHeaderIconLink
    | GuideVideoHeaderIconLink
    | GuideAudioHeaderIconLink
    | GuideTextHeaderIconLink
    | GuideButtonText
    | GuideParagraphText
      --- Search Page
    | SearchTitle
    | SearchMetaDescription
    | SearchTitleFiltered String String
    | SearchPlaceholder
    | ExploreGuidesListHeading
      --- Story Page
    | WhoSubHeading
    | WhereSubHeading
      --- SubmitStory Page
    | SubmitStoryMetaImageLink
      {-
         from formstack iframe embed code
      -}
    | SubmitFormSrc
      {-
         from formstack iframe embed code
      -}
    | SubmitFormTitle
    | SubmitFormHeading
      --- Category things
    | CategoryAdminAndInfoName
    | CategoryPublicityEventsName
    | CategoryWorkingWithPeopleName
    | CategoryWorkingWithAuthoritiesName
    | InCategory
      --- MetaData
    | StoryMetaDescription String
    | StoryMetaDescriptionWithAuthor String String
