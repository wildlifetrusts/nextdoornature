module I18n.Keys exposing (Key(..))


type Key
    = SiteTitle
      --- Page Titles
    | GuidesTitle
    | ChangeLanguage
      --- 404 content
    | Story404Title
    | Story404Body
    | Story404Slug
    | Guide404Title
    | Guide404Slug
    | Guide404Body
    | AncillaryPage404Slug
    | AncillaryPage404Title
    | AncillaryPage404Body
      --- Footer
    | FooterProjectInfo
    | FooterTitleColumnA
    | FooterTitleColumnB
    | FooterTitleColumnC
    | FooterVisitWebsiteText
    | FooterVisitWebsiteLink
    | FooterGuidesLinkText
    | FooterGuidesLink
    | FooterFindYourLocalTrustText
    | FooterFindYourLocalTrustLink
    | FooterPrivacyPolicyText
    | FooterPrivacyPolicyLink
      --- Cookie banner
    | CookieBannerH2
    | CookieBannerP
    | CookieAcceptButtonText
    | CookieDeclineButtonText
    | CookieSettingsButtonText
      --- Index Page
    | WelcomeP1
    | WelcomeP2
    | WelcomeP3
