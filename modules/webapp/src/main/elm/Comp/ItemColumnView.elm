{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Comp.ItemColumnView exposing (..)

import Api.Model.ItemFieldValue exposing (ItemFieldValue)
import Api.Model.ItemLight exposing (ItemLight)
import Data.CustomFieldType
import Data.ItemColumn exposing (ItemColumn(..))
import Data.ItemTemplate exposing (TemplateContext)
import Data.UiSettings exposing (UiSettings)
import Html exposing (Attribute, Html, div, i, text)
import Html.Attributes exposing (class)


renderDiv :
    TemplateContext
    -> UiSettings
    -> ItemColumn
    -> List (Attribute msg)
    -> ItemLight
    -> Html msg
renderDiv ctx settings col attr item =
    case col of
        Tags ->
            div attr
                (List.map
                    (\t ->
                        div
                            [ class "label text-sm mt-1"
                            , class <| Data.UiSettings.tagColorString2 t settings
                            ]
                            [ text t.name ]
                    )
                    item.tags
                )

        CustomField fieldName ->
            let
                maybeFieldValue =
                    item.customfields
                        |> List.filter (\cf -> cf.name == fieldName)
                        |> List.head
            in
            case maybeFieldValue of
                Nothing ->
                    div attr []

                Just fv ->
                    div attr [ renderFieldValue fv ]

        _ ->
            div attr
                [ text (Data.ItemColumn.renderString ctx col item)
                ]


{-| Render a custom field value with type-appropriate formatting
-}
renderFieldValue : ItemFieldValue -> Html msg
renderFieldValue fv =
    case Data.CustomFieldType.fromString fv.ftype of
        Just Data.CustomFieldType.Boolean ->
            if fv.value == "true" then
                i [ class "fa fa-check text-green-500" ] []

            else
                text ""

        Just Data.CustomFieldType.Date ->
            -- Date values are stored as ISO strings, display as-is for now
            -- Could be enhanced with locale formatting
            text fv.value

        Just Data.CustomFieldType.Money ->
            -- Money values - display with basic formatting
            text fv.value

        Just Data.CustomFieldType.Numeric ->
            text fv.value

        Just Data.CustomFieldType.Text ->
            text fv.value

        Nothing ->
            -- Unknown type, fall back to plain text
            text fv.value
