{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Data.ItemColumn exposing (..)

import Api.Model.ItemLight exposing (ItemLight)
import Data.ItemTemplate as IT exposing (TemplateContext)
import Json.Decode as D
import Json.Encode as E


type ItemColumn
    = Name
    | DateLong
    | DateShort
    | DueDateLong
    | DueDateShort
    | Folder
    | Correspondent
    | Concerning
    | Tags
    | CustomField String


all : List ItemColumn
all =
    [ Name, DateLong, DateShort, DueDateLong, DueDateShort, Folder, Correspondent, Concerning, Tags ]


renderString : TemplateContext -> ItemColumn -> ItemLight -> String
renderString ctx col item =
    case col of
        Name ->
            IT.render IT.name ctx item

        DateShort ->
            IT.render IT.dateShort ctx item

        DateLong ->
            IT.render IT.dateLong ctx item

        DueDateShort ->
            IT.render IT.dueDateShort ctx item

        DueDateLong ->
            IT.render IT.dueDateLong ctx item

        Folder ->
            IT.render IT.folder ctx item

        Correspondent ->
            IT.render IT.correspondent ctx item

        Concerning ->
            IT.render IT.concerning ctx item

        Tags ->
            List.map .name item.tags
                |> String.join ", "

        CustomField fieldName ->
            item.customfields
                |> List.filter (\cf -> cf.name == fieldName)
                |> List.head
                |> Maybe.map .value
                |> Maybe.withDefault ""


asString : ItemColumn -> String
asString col =
    case col of
        Name ->
            "name"

        DateShort ->
            "dateshort"

        DateLong ->
            "datelong"

        DueDateShort ->
            "duedateshort"

        DueDateLong ->
            "duedatelong"

        Folder ->
            "folder"

        Correspondent ->
            "correspondent"

        Concerning ->
            "concerning"

        Tags ->
            "tags"

        CustomField fieldName ->
            "customfield:" ++ fieldName


fromString : String -> Maybe ItemColumn
fromString str =
    case String.toLower str of
        "name" ->
            Just Name

        "dateshort" ->
            Just DateShort

        "datelong" ->
            Just DateLong

        "duedateshort" ->
            Just DueDateShort

        "duedatelong" ->
            Just DueDateLong

        "folder" ->
            Just Folder

        "correspondent" ->
            Just Correspondent

        "concerning" ->
            Just Concerning

        "tags" ->
            Just Tags

        _ ->
            if String.startsWith "customfield:" str then
                Just (CustomField (String.dropLeft 12 str))

            else
                Nothing


encode : ItemColumn -> E.Value
encode col =
    asString col |> E.string


decode : D.Decoder ItemColumn
decode =
    let
        from str =
            case fromString str of
                Just col ->
                    D.succeed col

                Nothing ->
                    D.fail ("Invalid column: " ++ str)
    in
    D.andThen from D.string
