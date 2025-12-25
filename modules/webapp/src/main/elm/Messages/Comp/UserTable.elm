{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.UserTable exposing
    ( Texts
    , de
    , fr
    , gb
    , sk
    )

import Data.TimeZone exposing (TimeZone)
import Messages.Basics
import Messages.DateFormat as DF
import Messages.UiLanguage


type alias Texts =
    { basics : Messages.Basics.Texts
    , login : String
    , state : String
    , source : String
    , email : String
    , logins : String
    , lastLogin : String
    , formatDateTime : Int -> String
    }


gb : TimeZone -> Texts
gb tz =
    { basics = Messages.Basics.gb
    , login = "Login"
    , state = "State"
    , source = "Type"
    , email = "E-Mail"
    , logins = "Logins"
    , lastLogin = "Last Login"
    , formatDateTime = DF.formatDateTimeLong Messages.UiLanguage.English tz
    }



sk : TimeZone -> Texts
sk tz =
    { basics = Messages.Basics.sk
    , login = "Prihláste sa"
    , state = "štátu"
    , source = "Typ"
    , email = "E-mail"
    , logins = "Prihlásenia"
    , lastLogin = "Posledné prihlásenie"
    , formatDateTime = DF.formatDateTimeLong Messages.UiLanguage.English tz
    }


de : TimeZone -> Texts
de tz =
    { basics = Messages.Basics.de
    , login = "Benutzername"
    , state = "Status"
    , source = "Typ"
    , email = "E-Mail"
    , logins = "Anmeldungen"
    , lastLogin = "Letzte Anmeldung"
    , formatDateTime = DF.formatDateTimeLong Messages.UiLanguage.German tz
    }


fr : TimeZone -> Texts
fr tz =
    { basics = Messages.Basics.fr
    , login = "Identifiant"
    , state = "Etat"
    , source = "Type"
    , email = "E-Mail"
    , logins = "Connexions"
    , lastLogin = "Dernière connexion"
    , formatDateTime = DF.formatDateTimeLong Messages.UiLanguage.French tz
    }
