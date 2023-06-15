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
      --- Cookie banner
    | CookieBannerH2
    | CookieBannerP
    | CookieAcceptButtonText
    | CookieDeclineButtonText
    | CookieSettingsButtonText
      --- Index Page
    | HomeTitle
    | WelcomeP1
    | WelcomeP2
    | WelcomeP3
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
      --- Guides Page
    | GuidesTitle
    | GuidesMetaDescription
    | GuidesTitleFiltered String String
    | SearchPlaceholder
    | ExploreGuidesListPlaceholder
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
