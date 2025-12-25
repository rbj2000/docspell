{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.ItemDetail.RunAddonForm exposing (Texts, de, fr, gb
    , sk)

import Messages.Basics


type alias Texts =
    { basics : Messages.Basics.Texts
    , runAddon : String
    , addonRunConfig : String
    , runAddonTitle : String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , runAddon = "Run an addon"
    , addonRunConfig = "Addon run configuration"
    , runAddonTitle = "Run the selected addon on this item."
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , runAddon = "Spustite doplnok"
    , addonRunConfig = "Konfigurácia spustenia doplnku"
    , runAddonTitle = "Spustite vybraný doplnok na tejto položke."
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , runAddon = "Addon ausführen"
    , addonRunConfig = "Addon Konfiguration"
    , runAddonTitle = "Run the selected addon on this item."
    }



-- TODO: translate-fr


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , runAddon = "Run an addon"
    , addonRunConfig = "Addon run configuration"
    , runAddonTitle = "Run the selected addon on this item."
    }
