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
    | CallForStoryP
    | CallForStoryLinkText
      --- Guide Page
    | RelatedGuidesHeading
    | RelatedStoriesHeading
    | GuidePrintHeader
    | GuideVideoHeader
    | GuideAudioHeader
    | GuideTextHeader
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
      --- Category things
    | CategoryAdminAndInfoName
    | CategoryPublicityEventsName
    | CategoryWorkingWithPeopleName
    | CategoryWorkingWithAuthoritiesName
    | InCategory
