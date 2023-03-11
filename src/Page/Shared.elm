module Page.Shared exposing (AudioMeta, CaseStudyTeaser, ResourceTeaser, VideoMeta)

import Url


type alias AudioMeta =
    { title : String
    , src : String
    }


type alias VideoMeta =
    { title : String
    , src : String
    }


type alias CaseStudyTeaser =
    { title : String
    , url : Url.Url
    }


type alias ResourceTeaser =
    { title : String
    , url : Url.Url
    }
