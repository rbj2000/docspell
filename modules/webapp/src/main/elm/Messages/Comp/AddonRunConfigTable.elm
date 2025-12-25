{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.AddonRunConfigTable exposing
    ( Texts
    , de
    , fr
    , gb
    , sk
    )

import Messages.Basics


type alias Texts =
    { basics : Messages.Basics.Texts
    , enabled : String
    , trigger : String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , enabled = "Enabled"
    , trigger = "Triggered"
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , enabled = "Povolené"
    , trigger = "Spustené"
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , enabled = "Aktive"
    , trigger = "Auslöser"
    }



-- TODO translate-fr


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , enabled = "Enabled"
    , trigger = "Triggered"
    }
