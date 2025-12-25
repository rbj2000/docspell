{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.ShareForm exposing
    ( Texts
    , de
    , fr
    , gb
    , sk
    )

import Messages.Basics


type alias Texts =
    { basics : Messages.Basics.Texts
    , queryLabel : String
    , enabled : String
    , password : String
    , publishUntil : String
    , clearPassword : String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , queryLabel = "Query"
    , enabled = "Enabled"
    , password = "Password"
    , publishUntil = "Publish Until"
    , clearPassword = "Remove password"
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , queryLabel = "Dopyt"
    , enabled = "Povolené"
    , password = "heslo"
    , publishUntil = "Zverejniť do"
    , clearPassword = "Odstráňte heslo"
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , queryLabel = "Abfrage"
    , enabled = "Aktiv"
    , password = "Passwort"
    , publishUntil = "Publiziert bis"
    , clearPassword = "Passwort entfernen"
    }


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , queryLabel = "Requête"
    , enabled = "Actif"
    , password = "Mot de passe"
    , publishUntil = "Publié jusqu'au"
    , clearPassword = "Supprimer le mot de passe"
    }
