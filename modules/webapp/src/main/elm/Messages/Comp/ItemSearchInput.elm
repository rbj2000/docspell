{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.ItemSearchInput exposing (Texts, de, fr, gb
    , sk)

import Http
import Messages.Basics
import Messages.Comp.HttpError


type alias Texts =
    { noResults : String
    , placeholder : String
    , httpError : Http.Error -> String
    }


gb : Texts
gb =
    { noResults = "No results"
    , placeholder = Messages.Basics.gb.searchPlaceholder
    , httpError = Messages.Comp.HttpError.gb
    }



sk : Texts
sk =
    { noResults = "Žiadne výsledky"
    , placeholder = Messages.Basics.sk.searchPlaceholder
    , httpError = Messages.Comp.HttpError.gb
    }


de : Texts
de =
    { noResults = "Keine Resultate"
    , placeholder = Messages.Basics.de.searchPlaceholder
    , httpError = Messages.Comp.HttpError.de
    }


fr : Texts
fr =
    { noResults = "Aucun document trouvé"
    , placeholder = Messages.Basics.fr.searchPlaceholder
    , httpError = Messages.Comp.HttpError.fr
    }
