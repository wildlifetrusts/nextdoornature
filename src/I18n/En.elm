module I18n.En exposing (enStrings)

import I18n.Keys exposing (Key(..))
import String.Case exposing (convertCase)


enStrings : Key -> String
enStrings key =
    case key of
        ---
        -- Page titles
        ---
        SiteTitle ->
            "[cCc] Team Wilder"

        StoryTitle ->
            "[cCc] Story"

        GuideTitle ->
            "[cCc] Guide"

        PageTitle string ->
            "[cCc]" ++ convertCase " " True False string

        GuidesTitle ->
            "[cCc] Guides"

        StoriesTitle ->
            "[cCc] Stories"

        ---
        -- Header
        ---
        ChangeLanguage ->
            "[cCc] Switch to Welsh"

        ---
        -- 404 content
        ---
        Guide404Title ->
            "[cCc] Sorry, we can't find that guide"

        Guide404Slug ->
            "guide-not-found"

        Guide404Body ->
            "[cCc] Try searching again [home](\"\\\")"

        Story404Title ->
            "[cCc] Sorry, we can't find that story"

        Story404Body ->
            "[cCc] Try searching again [home](\"\\\")"

        Story404Slug ->
            "story-not-found"

        AncillaryPage404Title ->
            "[cCc] Sorry, we can't find that page"

        AncillaryPage404Slug ->
            "page-not-found"

        AncillaryPage404Body ->
            "[cCc] Try searching again [home](\"\\\")"

        ---
        -- Footer
        ---
        FooterProjectInfo ->
            "[cCc] Project Info Text"

        FooterTitleColumnA ->
            "[cCc] Find out more"

        FooterTitleColumnB ->
            "[cCc] Explore the library"

        FooterTitleColumnC ->
            "[cCc] Get involved"

        FooterVisitWebsiteText ->
            "[cCc] Visit the Wildlife Trusts' main website"

        FooterVisitWebsiteLink ->
            --[cCc]
            "https://www.wildlifetrusts.org/"

        FooterFindYourLocalTrustText ->
            "[cCc] Find your local trust"

        FooterFindYourLocalTrustLink ->
            --[cCc]
            "https://www.wildlifetrusts.org/wildlife-trusts"

        ---
        -- Index page
        ---
        WelcomeP1 ->
            "[cCc] TeamWilder is an initiative launched by the Wilidlife Trusts in 2022. (Read more here) The aim of TeeamWilder is to equip everyone with the skills and knowledge they need to make a positive difference for nature - in their own area, and beyond."

        WelcomeP2 ->
            "[cCc] With the climate and environmental crisis ever worsining, it's important to recognise that there are actions all of us can take that can meaniningfully make a difference. It's easy to feel powerless, but in fact, together we are powerful!"

        WelcomeP3 ->
            "[cCc] The goal of TeamWilder is to get at least 1 in 4 people across the UK taking Action for Nature. This online library aims to support anyone who is interested in finding out what they can do, and how they can get other people involved."
