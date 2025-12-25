{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.BookmarkTable exposing
    ( Texts
    , de
    , fr
    , gb
    , sk
    )

import Messages.Basics


type alias Texts =
    { basics : Messages.Basics.Texts
    , user : String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , user = "User"
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , user = "raz"
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , user = "Benutzer"
    }


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , user = "Utilisateur"
    }
