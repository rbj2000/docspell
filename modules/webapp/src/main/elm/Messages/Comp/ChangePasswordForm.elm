{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.ChangePasswordForm exposing
    ( Texts
    , de
    , fr
    , gb
    , sk
    )

import Http
import Messages.Basics
import Messages.Comp.HttpError


type alias Texts =
    { basics : Messages.Basics.Texts
    , httpError : Http.Error -> String
    , currentPassword : String
    , newPassword : String
    , repeatPassword : String
    , currentPasswordPlaceholder : String
    , newPasswordPlaceholder : String
    , repeatPasswordPlaceholder : String
    , passwordMismatch : String
    , fillRequiredFields : String
    , passwordChangeSuccessful : String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , httpError = Messages.Comp.HttpError.gb
    , currentPassword = "Current Password"
    , newPassword = "New Password"
    , repeatPassword = "New Password (repeat)"
    , currentPasswordPlaceholder = "Password"
    , newPasswordPlaceholder = "Password"
    , repeatPasswordPlaceholder = "Password"
    , passwordMismatch = "The passwords do not match."
    , fillRequiredFields = "Please fill required fields."
    , passwordChangeSuccessful = "Password has been changed."
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , httpError = Messages.Comp.HttpError.sk
    , currentPassword = "Aktuálne heslo"
    , newPassword = "Nové heslo"
    , repeatPassword = "Nové heslo (opakovať)"
    , currentPasswordPlaceholder = "heslo"
    , newPasswordPlaceholder = "heslo"
    , repeatPasswordPlaceholder = "heslo"
    , passwordMismatch = "Heslá sa nezhodujú."
    , fillRequiredFields = "Vyplňte prosím povinné polia."
    , passwordChangeSuccessful = "Heslo bolo zmenené."
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , httpError = Messages.Comp.HttpError.de
    , currentPassword = "Passwort ändern"
    , newPassword = "Neues Passwort"
    , repeatPassword = "Neues Passwort (Wiederholung)"
    , currentPasswordPlaceholder = "Passwort"
    , newPasswordPlaceholder = "Passwort"
    , repeatPasswordPlaceholder = "Passwort"
    , passwordMismatch = "Die Passwörter stimmen nicht überein."
    , fillRequiredFields = "Bitte die erforderlichen Felder ausfüllen."
    , passwordChangeSuccessful = "Das Passwort wurde geändert."
    }


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , httpError = Messages.Comp.HttpError.fr
    , currentPassword = "Mot de passe actuel"
    , newPassword = "Nouveau mot de passe"
    , repeatPassword = "Nouveau mot de passe (confirmation)"
    , currentPasswordPlaceholder = "Mot de passe"
    , newPasswordPlaceholder = "Mot de passe"
    , repeatPasswordPlaceholder = "Mot de passe"
    , passwordMismatch = "Les mots de passe ne correspondent pas."
    , fillRequiredFields = "Veuillez compléter les champs requis."
    , passwordChangeSuccessful = "Le mot de passe a été mis à jour."
    }
