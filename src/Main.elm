module Main exposing (..)

import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Json
import Task


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


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


init : ( Model, Cmd Msg )
init =
    ( Model "" False Nothing Nothing
    , Cmd.none
    )


type Msg
    = NoOperation


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOperation ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ input [] [ text model.actorSearchFieldText ]
        , button [ ] [ text "Search" ]
        , actorsListView model.actors
        ]

actorsListView : Maybe (List Actor) -> Html Msg
actorsListView maybeActors =
    case maybeActors of
        Nothing ->
            text "Pending"
        Just actors ->
            div [] ( List.map actorView actors )

actorView : Actor -> Html Msg
actorView actor =
    text actor.name


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
