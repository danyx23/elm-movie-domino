module MovieDomino exposing (..)

import Html exposing (..)
import Html.App as Html
import Html.Events exposing (onClick)
import Models exposing (..)
import Views exposing (view)


main : Program Never
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( Model "" False Nothing Nothing
    , Cmd.none
    )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SearchClicked ->
            let
                newModel = { model | actors = Just [ Actor "Uma Thurman" 123 ] }
            in
                ( newModel, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
