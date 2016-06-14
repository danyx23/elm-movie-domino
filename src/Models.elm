module Models exposing (..)

type alias Movie =
    { name : String
    , id : Int
    }


type alias Actor =
    { name : String
    , id : Int
    }


type alias Model =
    { actorSearchFieldText : String
    , searchButtonEnabled : Bool
    , actors : Maybe (List Actor)
    , selectedActor : Maybe Int
    }

type Msg
    = SearchClicked
