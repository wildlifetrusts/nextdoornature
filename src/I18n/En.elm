module I18n.En exposing (enStrings)

import I18n.Keys exposing (Key(..))


enStrings : Key -> String
enStrings key =
    case key of
        PageTitle ->
            "[cCc] Init template"

        SiteTitle ->
            "Team Wilder"

        ChangeLanguage ->
            "Switch to Welsh"

        WelcomeP1 ->
            "TeamWilder is an initiative launched by the Wilidlife Trusts in 2022. (Read more here) The aim of TeeamWilder is to equip everyone with the skills and knowledge they need to make a positive difference for nature - in their own area, and beyond."

        WelcomeP2 ->
            "With the climate and environmental crisis ever worsining, it's important to recognise that there are actions all of us can take that can meaniningfully make a difference. It's easy to feel powerless, but in fact, together we are powerful!"

        WelcomeP3 ->
            "The goal of TeamWilder is to get at least 1 in 4 people across the UK taking Action for Nature. This online library aims to support anyone who is interested in finding out what they can do, and how they can get other people involved."
