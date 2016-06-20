module Models exposing (..)

import Http

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
    , errorMessage : Maybe String
    }

type DominoAppMessage
    = SearchClicked
    | SearchSucceeded (List Actor)
    | SearchFailed Http.Error
    | TextChanged String
