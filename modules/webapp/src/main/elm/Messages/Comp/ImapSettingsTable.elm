{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.ImapSettingsTable exposing (Texts, de, fr, gb
    , sk)

import Messages.Basics


type alias Texts =
    { basics : Messages.Basics.Texts
    , hostPort : String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , hostPort = "Host/Port"
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , hostPort = "Hostiteľ/Port"
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , hostPort = "Server/Port"
    }


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , hostPort = "Hôte/Port"
    }
