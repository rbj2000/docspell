{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.BoxStatsEdit exposing (Texts, de, fr, gb
    , sk)

import Messages.Comp.BoxSearchQueryInput


type alias Texts =
    { searchQuery : Messages.Comp.BoxSearchQueryInput.Texts
    , fieldStatistics : String
    , basicNumbers : String
    , showLabel : String
    , showItemCount : String
    }


gb : Texts
gb =
    { searchQuery = Messages.Comp.BoxSearchQueryInput.gb
    , fieldStatistics = "Field statistics"
    , basicNumbers = "Basic numbers"
    , showLabel = "Display"
    , showItemCount = "Show item count"
    }



sk : Texts
sk =
    { searchQuery = Messages.Comp.BoxSearchQueryInput.gb
    , fieldStatistics = "Štatistika v teréne"
    , basicNumbers = "Základné čísla"
    , showLabel = "Displej"
    , showItemCount = "Zobraziť počet položiek"
    }


de : Texts
de =
    { searchQuery = Messages.Comp.BoxSearchQueryInput.de
    , fieldStatistics = "Benutzerfeld Statistiken"
    , basicNumbers = "Allgemeine Zahlen"
    , showLabel = "Anzeige"
    , showItemCount = "Gesamtanzahl Dokumente mit anzeigen"
    }


fr : Texts
fr =
    { searchQuery = Messages.Comp.BoxSearchQueryInput.fr
    , fieldStatistics = "Statistiques des champs"
    , basicNumbers = "Résultats simples"
    , showLabel = "Afficher"
    , showItemCount = "Afficher le nombre de documents"
    }
