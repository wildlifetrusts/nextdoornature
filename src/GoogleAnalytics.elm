port module GoogleAnalytics exposing (updateAnalytics, updateAnalyticsEvent, updateAnalyticsPage)

-- js ports can only take one argument, so bundle event strings


type alias GaEvent =
    { category : String
    , action : String
    , label : String
    }


gaEvent : String -> String -> String -> GaEvent
gaEvent category action label =
    { category = category
    , action = action
    , label = label
    }


updateAnalytics : Bool -> Cmd msg -> Cmd msg
updateAnalytics hasConsented sendAnalyticsMessage =
    if hasConsented then
        sendAnalyticsMessage

    else
        Cmd.none


port updateAnalyticsPage : String -> Cmd msg


port updateAnalyticsEvent : GaEvent -> Cmd msg
