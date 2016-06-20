module ServerQueries exposing (searchPerson)

import Http
import Models exposing (..)
import Task
import Json.Decode exposing (..)

apiKey : String
apiKey =
    "b32dffae2b1277fe19a0f692f947cfa4"

apiBaseUrl : String
apiBaseUrl =
    "http://api.themoviedb.org/3/search/person"

searchPerson : String -> Cmd DominoAppMessage
searchPerson queryText =
    let
        url = Http.url apiBaseUrl [ ("api_key", apiKey), ("query", queryText) ]
    in
        Task.perform SearchFailed SearchSucceeded (Http.get decodeActors url)

decodeActors : Json.Decode.Decoder (List Actor)
decodeActors =
    "results" := Json.Decode.list decodeActor

decodeActor : Decoder Actor
decodeActor =
    Json.Decode.object2 Actor decodeName decodeId

decodeId : Decoder Int
decodeId =
    "id" := Json.Decode.int

decodeName : Decoder String
decodeName =
    "name" := Json.Decode.string
