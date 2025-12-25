{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.UserForm exposing
    ( Texts
    , de
    , fr
    , gb
    , sk
    )

import Messages.Basics


type alias Texts =
    { basics : Messages.Basics.Texts
    , login : String
    , state : String
    , email : String
    , password : String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , login = "Login"
    , state = "State"
    , email = "E-Mail"
    , password = "Password"
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , login = "Prihláste sa"
    , state = "štátu"
    , email = "E-mail"
    , password = "heslo"
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , login = "Benutzername"
    , state = "Status"
    , email = "E-Mail"
    , password = "Passwort"
    }


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , login = "Identifiant"
    , state = "Etat"
    , email = "E-Mail"
    , password = "Mot de passe"
    }
