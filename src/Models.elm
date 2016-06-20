module Models exposing (..)

import Http


type alias Actor =
    { name : String
    , id : Int
    }


type alias Model =
    { actorSearchFieldText : String
    , actors : Maybe (List Actor)
    , errorMessage : Maybe String
    }


type DominoAppMessage
    = SearchClicked
    | SearchSucceeded (List Actor)
    | SearchFailed Http.Error
    | TextChanged String
