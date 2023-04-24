port module Metadata exposing (metadataFromPage, setMetadata)

import Route exposing (Route(..))


type alias PageMetadata =
    { title : String
    , description : String
    }


metadataFromPage : Route -> PageMetadata
metadataFromPage page =
    { title = "My title"
    , description = "My description"
    }


port setMetadata : PageMetadata -> Cmd msg
