{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.BoxStatsView exposing (Texts, de, fr, gb
    , sk)

import Http
import Messages.Basics
import Messages.Comp.HttpError
import Messages.Comp.SearchStatsView


type alias Texts =
    { httpError : Http.Error -> String
    , errorOccurred : String
    , statsView : Messages.Comp.SearchStatsView.Texts
    , basics : Messages.Basics.Texts
    }


gb : Texts
gb =
    { httpError = Messages.Comp.HttpError.gb
    , errorOccurred = "Error retrieving data."
    , statsView = Messages.Comp.SearchStatsView.gb
    , basics = Messages.Basics.gb
    }



sk : Texts
sk =
    { httpError = Messages.Comp.HttpError.sk
    , errorOccurred = "Chyba pri načítavaní údajov."
    , statsView = Messages.Comp.SearchStatsView.sk
    , basics = Messages.Basics.sk
    }


de : Texts
de =
    { httpError = Messages.Comp.HttpError.de
    , errorOccurred = "Fehler beim Laden der Daten."
    , statsView = Messages.Comp.SearchStatsView.de
    , basics = Messages.Basics.de
    }


fr : Texts
fr =
    { httpError = Messages.Comp.HttpError.fr
    , errorOccurred = "Erreur en récupérant les données."
    , statsView = Messages.Comp.SearchStatsView.fr
    , basics = Messages.Basics.fr
    }
