{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Data.DownloadFileType exposing (Texts, de, fr, gb
    , sk)

import Data.DownloadFileType exposing (DownloadFileType(..))


type alias Texts =
    DownloadFileType -> String


gb : Texts
gb ft =
    case ft of
        Converted ->
            "Converted PDF files"

        Originals ->
            "Original files"



sk : Texts
sk ft =
    case ft of
        Converted ->
            "Konvertované súbory PDF"

        Originals ->
            "Original files"


de : Texts
de ft =
    case ft of
        Converted ->
            "Konvertierte PDF Dateien"

        Originals ->
            "Original Dateien"


fr : Texts
fr ft =
    case ft of
        Converted ->
            "Fichiers PDF convertis"

        Originals ->
            "Fichiers originaux"
