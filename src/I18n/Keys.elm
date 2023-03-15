module I18n.Keys exposing (Key(..))


type Key
    = SiteTitle
      --- Page Titles
    | StoryTitle
    | GuideTitle
    | ChangeLanguage
      --- 404 content
    | Story404Title
    | Story404Body
    | Guide404Title
    | Guide404Slug
    | Guide404Body
      --- Footer
    | FooterProjectInfo
    | FooterTitleColumnA
    | FooterTitleColumnB
    | FooterTitleColumnC
    | FooterVisitWebsiteText
    | FooterVisitWebsiteLink
    | FooterFindYourLocalTrustText
    | FooterFindYourLocalTrustLink
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
