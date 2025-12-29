{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.EmailSettingsForm exposing
    ( Texts
    , de
    , fr
    , gb
    , sk
    )

import Data.SSLType exposing (SSLType)
import Messages.Basics
import Messages.Data.SSLType


type alias Texts =
    { basics : Messages.Basics.Texts
    , sslTypeLabel : SSLType -> String
    , connectionPlaceholder : String
    , connectionNameInfo : String
    , smtpHost : String
    , smtpHostPlaceholder : String
    , smtpPort : String
    , smtpUser : String
    , smtpUserPlaceholder : String
    , smtpPassword : String
    , smtpPasswordPlaceholder : String
    , fromAddress : String
    , fromAddressPlaceholder : String
    , replyTo : String
    , replyToPlaceholder : String
    , ssl : String
    , ignoreCertCheck : String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , sslTypeLabel = Messages.Data.SSLType.gb
    , connectionPlaceholder = "Connection name, e.g. 'gmail.com'"
    , connectionNameInfo = "The connection name must not contain whitespace or special characters."
    , smtpHost = "SMTP Host"
    , smtpHostPlaceholder = "SMTP host name, e.g. 'mail.gmail.com'"
    , smtpPort = "SMTP Port"
    , smtpUser = "SMTP User"
    , smtpUserPlaceholder = "SMTP Username, e.g. 'your.name@gmail.com'"
    , smtpPassword = "SMTP Password"
    , smtpPasswordPlaceholder = "Password"
    , fromAddress = "From Address"
    , fromAddressPlaceholder = "Sender E-Mail address"
    , replyTo = "Reply-To"
    , replyToPlaceholder = "Optional Reply-To E-Mail address"
    , ssl = "SSL"
    , ignoreCertCheck = "Ignore certificate check"
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , sslTypeLabel = Messages.Data.SSLType.sk
    , connectionPlaceholder = "Názov spojenia, napr. 'gmail.com'"
    , connectionNameInfo = "Názov pripojenia nesmie obsahovať medzery ani špeciálne znaky."
    , smtpHost = "Hostiteľ SMTP"
    , smtpHostPlaceholder = "Názov hostiteľa SMTP, napr. 'mail.gmail.com'"
    , smtpPort = "Port SMTP"
    , smtpUser = "Používateľ SMTP"
    , smtpUserPlaceholder = "Používateľské meno SMTP, napr. 'vase.meno@gmail.com'"
    , smtpPassword = "Heslo SMTP"
    , smtpPasswordPlaceholder = "heslo"
    , fromAddress = "Od adresy"
    , fromAddressPlaceholder = "E-mailová adresa odosielateľa"
    , replyTo = "Odpovedať"
    , replyToPlaceholder = "Voliteľná e-mailová adresa na odpoveď"
    , ssl = "SSL"
    , ignoreCertCheck = "Ignorovať kontrolu certifikátu"
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , sslTypeLabel = Messages.Data.SSLType.de
    , connectionPlaceholder = "Name der Verbindung, z.B. 'gmail.com'"
    , connectionNameInfo = "Der Name muss eine gültige ID sein, es dürfen keine Leer- oder Sonderzeichen verwendet werden."
    , smtpHost = "SMTP-Server"
    , smtpHostPlaceholder = "SMTP-Server, z.B. 'mail.gmail.com'"
    , smtpPort = "SMTP-Port"
    , smtpUser = "SMTP-Benutzer"
    , smtpUserPlaceholder = "SMTP-Benutzername, z.B. 'your.name@gmail.com'"
    , smtpPassword = "SMTP-Passwort"
    , smtpPasswordPlaceholder = "Passwort"
    , fromAddress = "Absenderadresse"
    , fromAddressPlaceholder = "E-Mail-Adresse des Absenders"
    , replyTo = "Antwort an"
    , replyToPlaceholder = "Optionale Antwortadresse"
    , ssl = "SSL"
    , ignoreCertCheck = "Zertifikatsprüfung ignorieren"
    }


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , sslTypeLabel = Messages.Data.SSLType.fr
    , connectionPlaceholder = "Nom de la connection ex: 'gmail.com'"
    , connectionNameInfo = "Le nom ne doit pas comprendre d'espace ou de caractères spéciaux."
    , smtpHost = "Hôte SMTP"
    , smtpHostPlaceholder = "SMTP hostname ex: 'mail.gmail.com'"
    , smtpPort = "Port SMTP"
    , smtpUser = "Identifiant SMTP"
    , smtpUserPlaceholder = "identifiant SMTP, ex: 'your.name@gmail.com'"
    , smtpPassword = "Mot de passe SMTP"
    , smtpPasswordPlaceholder = "Mot de passe"
    , fromAddress = "De"
    , fromAddressPlaceholder = "Email de l'expéditeur"
    , replyTo = "Répondre à"
    , replyToPlaceholder = "Adresse de réponse optionnelle"
    , ssl = "SSL"
    , ignoreCertCheck = "Ignorer la vérification des certificats"
    }
