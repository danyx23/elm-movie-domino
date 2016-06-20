module MovieDomino exposing (..)

import Http
import Html.App as Html
import Models exposing (..)
import Views exposing (view)
import ServerQueries exposing (searchPerson)


main : Program Never
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd DominoAppMessage )
init =
    ( Model "" Nothing Nothing
    , Cmd.none
    )


update : DominoAppMessage -> Model -> ( Model, Cmd DominoAppMessage )
update msg model =
    case msg of
        SearchClicked ->
            ( model, searchPerson model.actorSearchFieldText )

        SearchSucceeded actorsList ->
            let
                newModel =
                    { model
                        | actors = Just actorsList
                        , errorMessage = Nothing
                    }
            in
                ( newModel, Cmd.none )

        SearchFailed error ->
            let
                errorMessage =
                    case error of
                        Http.Timeout ->
                            "Connection timed out"

                        Http.NetworkError ->
                            "Network error"

                        Http.UnexpectedPayload message ->
                            message

                        Http.BadResponse errorcode message ->
                            message

                newModel =
                    { model | errorMessage = Just errorMessage }
            in
                ( newModel, Cmd.none )

        TextChanged newText ->
            let
                newModel =
                    { model | actorSearchFieldText = newText }
            in
                ( newModel, Cmd.none )


subscriptions : Model -> Sub DominoAppMessage
subscriptions model =
    Sub.none
