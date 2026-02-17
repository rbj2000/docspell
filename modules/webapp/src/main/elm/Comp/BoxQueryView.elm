{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Comp.BoxQueryView exposing (Model, Msg, init, reloadData, update, view)

import Api
import Api.Model.ItemLight exposing (ItemLight)
import Api.Model.ItemLightList exposing (ItemLightList)
import Api.Model.ItemOrderBy exposing (ItemOrderBy)
import Api.Model.ItemQuery exposing (ItemQuery)
import Comp.Basic
import Comp.ItemColumnView
import Data.BoxContent exposing (QueryData, SearchQuery(..))
import Data.Flags exposing (Flags)
import Data.ItemColumn as IC exposing (ItemColumn)
import Data.Items
import Data.SearchMode
import Data.UiSettings exposing (UiSettings)
import Html exposing (Html, a, div, i, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (class, classList)
import Util.Html
import Http
import Messages.Comp.BoxQueryView exposing (Texts)
import Page exposing (Page(..))
import Styles


type alias Model =
    { results : ViewResult
    , meta : QueryData
    }


type ViewResult
    = Loading
    | Loaded ItemLightList
    | Failed Http.Error


type Msg
    = ItemsResp (Result Http.Error ItemLightList)
    | ReloadData
    | SortClick ItemColumn


init : Flags -> QueryData -> ( Model, Cmd Msg )
init flags data =
    ( { results = Loading
      , meta = data
      }
    , dataCmd flags data
    )


reloadData : Msg
reloadData =
    ReloadData



--- Update


update : Flags -> Msg -> Model -> ( Model, Cmd Msg, Bool )
update flags msg model =
    case msg of
        ItemsResp (Ok list) ->
            ( { model | results = Loaded list }, Cmd.none, False )

        ItemsResp (Err err) ->
            ( { model | results = Failed err }, Cmd.none, False )

        ReloadData ->
            ( model, dataCmd flags model.meta, True )

        SortClick col ->
            let
                newMeta =
                    toggleSort col model.meta
            in
            ( { model | meta = newMeta }, dataCmd flags newMeta, True )



--- View


view : Texts -> UiSettings -> Model -> Html Msg
view texts settings model =
    case model.results of
        Loading ->
            div [ class "h-24 " ]
                [ Comp.Basic.loadingDimmer
                    { label = ""
                    , active = True
                    }
                ]

        Failed err ->
            div
                [ class "py-4"
                , class Styles.errorMessage
                ]
                [ text texts.errorOccurred
                , text ": "
                , text (texts.httpError err)
                ]

        Loaded list ->
            if list.groups == [] then
                viewEmpty texts

            else
                viewItems texts settings model.meta list


viewItems : Texts -> UiSettings -> QueryData -> ItemLightList -> Html Msg
viewItems texts settings meta list =
    let
        items =
            Data.Items.flatten list
    in
    table [ class "w-full divide-y divide-y-2 dark:divide-slate-500" ]
        (viewItemHead texts meta items ++ [ tbody [ class "divide-y divide-dotted dark:divide-slate-500" ] <| List.map (viewItemRow texts settings meta) items ])


viewItemHead : Texts -> QueryData -> List ItemLight -> List (Html Msg)
viewItemHead texts meta items =
    let
        ( col1, cols ) =
            getColumns meta

        allCols =
            col1 :: cols

        isSecond n =
            n == 1

        isNotLast n =
            n > 1 && n < List.length cols

        columnHeaderText col =
            case col of
                IC.CustomField fieldName ->
                    lookupFieldLabel fieldName items
                        |> Maybe.withDefault fieldName

                _ ->
                    texts.itemColumn.header col

        sortIcon col =
            if meta.sortColumn == Just col then
                if meta.sortDirection == Just "desc" then
                    "fa fa-sort-alpha-down-alt"

                else
                    "fa fa-sort-alpha-up"

            else
                "invisible fa fa-sort-alpha-down"

        renderHeader index col =
            let
                label =
                    columnHeaderText col
            in
            th
                [ class "text-left text-sm"
                , classList
                    [ ( "hidden sm:table-cell", isSecond index )
                    , ( "hidden md:table-cell", isNotLast index )
                    ]
                ]
                (if isSortable col then
                    [ a
                        [ Util.Html.onClickk (SortClick col)
                        , class "hover:underline cursor-pointer"
                        ]
                        [ i [ class (sortIcon col), class "mr-1" ] []
                        , text label
                        ]
                    ]

                 else
                    [ text label ]
                )
    in
    if not meta.showHeaders then
        []

    else
        [ thead []
            [ tr []
                (List.indexedMap renderHeader allCols)
            ]
        ]


lookupFieldLabel : String -> List ItemLight -> Maybe String
lookupFieldLabel fieldName items =
    items
        |> List.filterMap
            (\item ->
                item.customfields
                    |> List.filter (\cf -> cf.name == fieldName)
                    |> List.head
                    |> Maybe.andThen .label
                    |> Maybe.andThen
                        (\l ->
                            if String.isEmpty l then
                                Nothing

                            else
                                Just l
                        )
            )
        |> List.head


viewItemRow : Texts -> UiSettings -> QueryData -> ItemLight -> Html Msg
viewItemRow texts settings meta item =
    let
        ( col1, cols ) =
            getColumns meta

        isSecond n =
            n == 0

        isNotLast n =
            n > 0 && n < (List.length cols - 1)

        render col =
            Comp.ItemColumnView.renderDiv
                texts.templateCtx
                settings
                col
                [ class "flex flex-row break-all flex-wrap space-x-1" ]
                item

        td1 =
            td [ class "py-2 px-1" ]
                [ a
                    [ class Styles.link
                    , Page.href (ItemDetailPage item.id)
                    ]
                    [ render col1
                    ]
                ]

        tdRem index col =
            td
                [ class "py-1 px-1"
                , classList
                    [ ( "hidden sm:table-cell", isSecond index )
                    , ( "hidden md:table-cell", isNotLast index )
                    ]
                ]
                [ render col
                ]
    in
    tr []
        (td1 :: List.indexedMap tdRem cols)


viewEmpty : Texts -> Html Msg
viewEmpty texts =
    div [ class "flex justify-center items-center h-full" ]
        [ div [ class "px-4 py-4 text-center align-middle text-lg" ]
            [ i [ class "fa fa-smile font-thin mr-2" ] []
            , text texts.noResults
            ]
        ]



--- Helpers


getColumns : QueryData -> ( ItemColumn, List ItemColumn )
getColumns meta =
    case meta.columns of
        x :: xs ->
            ( x, xs )

        [] ->
            ( IC.Name, [ IC.Correspondent, IC.DateShort ] )


isSortable : ItemColumn -> Bool
isSortable col =
    case col of
        IC.Name ->
            True

        IC.DateShort ->
            True

        IC.DateLong ->
            True

        IC.DueDateShort ->
            True

        IC.DueDateLong ->
            True

        IC.CustomField _ ->
            True

        _ ->
            False


toggleSort : ItemColumn -> QueryData -> QueryData
toggleSort col meta =
    if meta.sortColumn == Just col then
        let
            newDir =
                if meta.sortDirection == Just "asc" then
                    Just "desc"

                else
                    Just "asc"
        in
        { meta | sortDirection = newDir }

    else
        { meta | sortColumn = Just col, sortDirection = Just "asc" }


mkOrderBy : QueryData -> Maybe ItemOrderBy
mkOrderBy meta =
    meta.sortColumn
        |> Maybe.map
            (\col ->
                { field = Just (IC.asString col)
                , direction = meta.sortDirection
                }
            )


mkQuery : String -> QueryData -> ItemQuery
mkQuery q meta =
    { query = q
    , limit = Just meta.limit
    , offset = Nothing
    , searchMode = Just <| Data.SearchMode.asString Data.SearchMode.Normal
    , withDetails = Just meta.details
    , orderBy = mkOrderBy meta
    }


dataCmd : Flags -> QueryData -> Cmd Msg
dataCmd flags data =
    case data.query of
        SearchQueryString q ->
            Api.itemSearch flags (mkQuery q data) ItemsResp

        SearchQueryBookmark bmId ->
            Api.itemSearchBookmark flags (mkQuery bmId data) ItemsResp
