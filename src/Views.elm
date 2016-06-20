module Views exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (placeholder, class)

import Models exposing (Model, DominoAppMessage(..), Actor)


view : Model -> Html DominoAppMessage
view model =
    div []
        (   [ renderHeader ]
            ++ (renderErrorMessage model.errorMessage)
            ++ [ (renderSearchField model) ]
            ++ [ renderActorsListView model.actors ]
        )


renderErrorMessage : Maybe String -> List (Html DominoAppMessage)
renderErrorMessage maybeErrors =
    case maybeErrors of
        Nothing ->
            []

        Just errors ->
            [ div [ class "bg-danger" ] [ text errors ] ]


renderSearchField : Model -> Html DominoAppMessage
renderSearchField model =
    div [ class "input-group" ]
        [ input
            [ placeholder "e.g. Uma Thurman"
            , onInput TextChanged
            , class "form-control"
            ]
            [ text model.actorSearchFieldText ]
        , span
            [ class "input-group-btn"
            ]
            [ button
                [ onClick SearchClicked
                , class "btn btn-default"
                ]
                [ text "Search" ]
            ]
        ]


renderHeader : Html DominoAppMessage
renderHeader =
    h1 [] [ text "Movie Domino" ]


renderActorsListView : Maybe (List Actor) -> Html DominoAppMessage
renderActorsListView maybeActors =
    case maybeActors of
        Nothing ->
            text "Pending"

        Just actors ->
            div [ class "list-group" ] (List.map renderActorView actors)


renderActorView : Actor -> Html DominoAppMessage
renderActorView actor =
    button [ class "list-group-item" ] [ text actor.name ]
