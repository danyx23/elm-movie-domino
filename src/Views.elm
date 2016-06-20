module Views exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (placeholder)
import Models exposing (Model, DominoAppMessage(..), Actor)


view : Model -> Html DominoAppMessage
view model =
    div []
        [ header
        , searchField model
        , actorsListView model.actors
        ]


searchField : Model -> Html DominoAppMessage
searchField model =
    div []
        [ input [ placeholder "e.g. Uma Thurman", onInput TextChanged ] [ text model.actorSearchFieldText ]
        , button [ onClick SearchClicked ] [ text "Search" ]
        ]


header : Html a
header =
    h1 [] [ text "Movie Domino" ]


actorsListView : Maybe (List Actor) -> Html DominoAppMessage
actorsListView maybeActors =
    case maybeActors of
        Nothing ->
            text "Pending"

        Just actors ->
            div [] (List.map actorView actors)


actorView : Actor -> Html DominoAppMessage
actorView actor =
    text actor.name
