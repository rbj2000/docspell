{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.TagTable exposing
    ( Texts
    , de
    , fr
    , gb
    , sk
    )

import Messages.Basics


type alias Texts =
    { basics : Messages.Basics.Texts
    , category : String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , category = "Category"
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , category = "Kategória"
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , category = "Kategorie"
    }


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , category = "Catégorie"
    }
