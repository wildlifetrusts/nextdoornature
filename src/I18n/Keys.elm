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
    | FooterAboutText
    | FooterGuidesLinkText
    | FooterStoriesLinkText
    | FooterFindYourLocalTrustText
    | FooterShareYourStoryText
    | FooterPrivacyPolicyText
    | FooterHowToUseThisSiteText
    | FooterSiteLogo
    | FooterCharityInfo
    | RegisteredCharityNumber
    | HeritageFundLogoAlt
    | PlatiJubesLogoAlt
    | WildLifeTrustLogoAlt
      --- Cookie banner
    | CookieBannerH2
    | CookieBannerP
    | CookieAcceptButtonText
    | CookieDeclineButtonText
    | CookieSettingsButtonText
      --- Index Page
    | IndexMetaDescription
    | GuideHighlightsSubtitle
    | StoryHighlightsSubtitle
    | CallForStoryHeading
    | HomeCallForStoryP
    | CallForStoryP
    | CallForStoryLinkText
    | HomeYoutubeLink
    | HomeVideoTitle
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
    | GuidesHeading
    | StoriesHeading
    | ActionsHeading
    | SearchPlaceholder
    | ExploreGuidesListHeading
      --- Story Page
    | WhoSubHeading
    | WhereSubHeading
      --- SubmitStory Page
    | SubmitStoryMetaImageLink
    | SubmitStoryFormSrc
    | SubmitStoryFormTitle
      --- Category things
    | CategoryAdminAndInfoName
    | CategoryPublicityEventsName
    | CategoryWorkingWithPeopleName
    | CategoryWorkingWithAuthoritiesName
      --- MetaData
    | StoryMetaDescription String
    | StoryMetaDescriptionWithAuthor String String
