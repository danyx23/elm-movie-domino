module MovieDomino exposing (..)

import Html exposing (..)
import Html.App as Html
import Html.Events exposing (onClick)


main : Program Never
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
    = SearchClicked


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SearchClicked ->
            let
                newModel = { model | actors = Just [ Actor "Uma Thurman" 123 ] }
            in
                ( newModel, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ header
        , searchField model
        , actorsListView model.actors
        ]

searchField : { a | actorSearchFieldText : String } -> Html Msg
searchField model =
    div [ ]
        [ input [] [ text model.actorSearchFieldText ]
        , button [ onClick SearchClicked ] [ text "Search" ]
        ]

header : Html a
header =
    h1 [] [ text "Movie Domino" ]

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
