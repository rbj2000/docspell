{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Comp.DashboardView exposing (Model, Msg, UpdateResult, init, reloadData, update, view, viewBox)

import Comp.BoxView
import Data.Dashboard exposing (Dashboard)
import Data.Flags exposing (Flags)
import Data.UiSettings exposing (UiSettings)
import Dict exposing (Dict)
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Messages.Comp.DashboardView exposing (Texts)


type alias Model =
    { dashboard : Dashboard
    , boxModels : Dict Int Comp.BoxView.Model
    }


type alias UpdateResult =
    { model : Model
    , cmd : Cmd Msg
    , sub : Sub Msg
    , contentChanged : Bool
    }


type Msg
    = BoxMsg Int Comp.BoxView.Msg
    | ReloadData


init : Flags -> Dashboard -> ( Model, Cmd Msg )
init flags db =
    let
        ( boxModels, cmds ) =
            List.map (Comp.BoxView.init flags) db.boxes
                |> List.indexedMap (\a -> \( bm, bc ) -> ( bm, Cmd.map (BoxMsg a) bc ))
                |> List.unzip
    in
    ( { dashboard = db
      , boxModels =
            List.indexedMap Tuple.pair boxModels
                |> Dict.fromList
      }
    , Cmd.batch cmds
    )


reloadData : Msg
reloadData =
    ReloadData



--- Update


update : Flags -> Msg -> Model -> UpdateResult
update flags msg model =
    case msg of
        BoxMsg index lm ->
            case Dict.get index model.boxModels of
                Just bm ->
                    let
                        result =
                            Comp.BoxView.update flags lm bm

                        newBoxModels =
                            Dict.insert index result.model model.boxModels

                        updatedDashboard =
                            if result.contentChanged then
                                rebuildDashboard { model | boxModels = newBoxModels }

                            else
                                model.dashboard
                    in
                    { model = { model | boxModels = newBoxModels, dashboard = updatedDashboard }
                    , cmd = Cmd.map (BoxMsg index) result.cmd
                    , sub = Sub.map (BoxMsg index) result.sub
                    , contentChanged = result.contentChanged
                    }

                Nothing ->
                    unit model

        ReloadData ->
            let
                pairs =
                    Dict.keys model.boxModels

                applyAll mdl =
                    List.foldl
                        (\index acc ->
                            let
                                r =
                                    update flags (BoxMsg index Comp.BoxView.reloadData) acc.model
                            in
                            { model = r.model
                            , cmds = r.cmd :: acc.cmds
                            , subs = r.sub :: acc.subs
                            }
                        )
                        { model = mdl, cmds = [], subs = [] }
                        pairs

                result =
                    applyAll model
            in
            { model = result.model
            , cmd = Cmd.batch result.cmds
            , sub = Sub.batch result.subs
            , contentChanged = False
            }


rebuildDashboard : Model -> Dashboard
rebuildDashboard model =
    let
        db =
            model.dashboard

        boxes =
            Dict.values model.boxModels
                |> List.map .box
    in
    { db | boxes = boxes }


unit : Model -> UpdateResult
unit model =
    { model = model, cmd = Cmd.none, sub = Sub.none, contentChanged = False }



--- View


view : Texts -> Flags -> UiSettings -> Model -> Html Msg
view texts flags settings model =
    div
        [ class (gridStyle model.dashboard)
        ]
        (List.indexedMap (viewBox texts flags settings) <| Dict.values model.boxModels)


viewBox : Texts -> Flags -> UiSettings -> Int -> Comp.BoxView.Model -> Html Msg
viewBox texts flags settings index box =
    Html.map (BoxMsg index)
        (Comp.BoxView.view texts.boxView flags settings box)



--- Helpers


{-| note due to tailwinds purging css that is not found in source
files, need to spell them out somewhere - which is done it keep.txt in
this case.
-}
gridStyle : Dashboard -> String
gridStyle db =
    let
        cappedGap =
            min db.gap 12

        cappedCol =
            min db.columns 12

        gapStyle =
            " gap-" ++ String.fromInt cappedGap ++ " "

        colStyle =
            case db.columns of
                1 ->
                    ""

                _ ->
                    " md:grid-cols-" ++ String.fromInt cappedCol ++ " "
    in
    "grid grid-cols-1 " ++ gapStyle ++ colStyle
