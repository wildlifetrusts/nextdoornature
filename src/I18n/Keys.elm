module I18n.Keys exposing (Key(..))


type Key
    = SiteTitle
    | ChangeLanguage
      --- 404 content
    | Story404Title
    | Story404Body
    | Guide404Title
    | Guide404Slug
    | Guide404Body
    | AncillaryPage404Slug
    | AncillaryPage404Title
    | AncillaryPage404Body
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
      --- Guide Page
    | RelatedGuidesHeading
    | RelatedStoriesHeading
      --- Guides Page
    | GuidesTitle
    | GuidesTitleFiltered String String
    | SearchPlaceholder
    | ExploreGuidesListPlaceholder
      --- Story Page
    | WhoSubHeading
    | WhereSubHeading
      --- SubmitStory Page
    | SubmitStoryHeading
    | SubmitStoryP1
    | SubmitStoryP2
      {-
         from formstack iframe embed code
      -}
    | SubmitFormSrc
      {-
         from formstack iframe embed code
      -}
    | SubmitFormTitle
    | SubmitFormHeading
