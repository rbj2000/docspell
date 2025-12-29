{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.EquipmentTable exposing
    ( Texts
    , de
    , fr
    , gb
    , sk
    )

import Data.EquipmentUse exposing (EquipmentUse)
import Messages.Basics
import Messages.Data.EquipmentUse


type alias Texts =
    { basics : Messages.Basics.Texts
    , use : String
    , equipmentUseLabel : EquipmentUse -> String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , use = "Use"
    , equipmentUseLabel = Messages.Data.EquipmentUse.gb
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , use = "Použite"
    , equipmentUseLabel = Messages.Data.EquipmentUse.sk
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , use = "Art"
    , equipmentUseLabel = Messages.Data.EquipmentUse.de
    }


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , use = "Utiliser"
    , equipmentUseLabel = Messages.Data.EquipmentUse.fr
    }
