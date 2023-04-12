port module GoogleAnalytics exposing (updateAnalytics, updateAnalyticsEvent, updateAnalyticsPage)


type alias GaEvent =
    { category : String
    , action : String
    , label : String
    }


updateAnalytics : Bool -> Cmd msg -> Cmd msg
updateAnalytics hasConsented sendAnalyticsMessage =
    if hasConsented then
        sendAnalyticsMessage

    else
        Cmd.none


port updateAnalyticsPage : String -> Cmd msg


port updateAnalyticsEvent : GaEvent -> Cmd msg
