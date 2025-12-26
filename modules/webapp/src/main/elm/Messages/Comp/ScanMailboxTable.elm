{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.ScanMailboxTable exposing
    ( Texts
    , de
    , fr
    , gb
    , sk
    )

import Messages.Basics


type alias Texts =
    { basics : Messages.Basics.Texts
    , summary : String
    , connection : String
    , folders : String
    , receivedSince : String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , summary = "Summary"
    , connection = "Connection"
    , folders = "Folders"
    , receivedSince = "Received Since"
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , summary = "Zhrnutie"
    , connection = "Pripojenie"
    , folders = "Priečinky"
    , receivedSince = "Prijaté od"
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , summary = "Kurzbeschreibung"
    , connection = "Verbindung"
    , folders = "Ordner"
    , receivedSince = "Empfangen seit"
    }


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , summary = "Résumé"
    , connection = "Connexion"
    , folders = "Dossiers"
    , receivedSince = "Reçu depuis"
    }
