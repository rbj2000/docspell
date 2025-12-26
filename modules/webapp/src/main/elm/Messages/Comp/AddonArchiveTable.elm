{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.AddonArchiveTable exposing
    ( Texts
    , de
    , fr
    , gb
    , sk
    )

import Messages.Basics


type alias Texts =
    { basics : Messages.Basics.Texts
    , version : String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , version = "Version"
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , version = "Verzia"
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , version = "Version"
    }


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , version = "Version"
    }
