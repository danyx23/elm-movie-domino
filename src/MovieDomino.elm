module MovieDomino exposing (..)

import Html.App as Html
import Models exposing (..)
import Views exposing (view)
import Http


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
    ( Model "" False Nothing Nothing Nothing
    , Cmd.none
    )


update : DominoAppMessage -> Model -> ( Model, Cmd DominoAppMessage )
update msg model =
    case msg of
        SearchClicked ->
            let
                newModel =
                    { model | actors = Just [ Actor "Uma Thurman" 123 ] }
            in
                ( newModel, Cmd.none )

        SearchSucceeded actorsList ->
            ( model, Cmd.none )

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
