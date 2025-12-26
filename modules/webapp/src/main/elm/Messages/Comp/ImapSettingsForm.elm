{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.ImapSettingsForm exposing
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
    , connectionNamePlaceholder : String
    , connectionNameInfo : String
    , imapHost : String
    , imapHostPlaceholder : String
    , imapPort : String
    , imapUser : String
    , imapUserPlaceholder : String
    , imapPassword : String
    , imapPasswordPlaceholder : String
    , ssl : String
    , ignoreCertCheck : String
    , enableOAuth2 : String
    , oauth2Info : String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , sslTypeLabel = Messages.Data.SSLType.gb
    , connectionNamePlaceholder = "Connection name, e.g. 'gmail.com'"
    , connectionNameInfo = "The connection name must not contain whitespace or special characters."
    , imapHost = "IMAP Host"
    , imapHostPlaceholder = "IMAP host name, e.g. 'mail.gmail.com'"
    , imapPort = "IMAP Port"
    , imapUser = "IMAP User"
    , imapUserPlaceholder = "IMAP Username, e.g. 'your.name@gmail.com'"
    , imapPassword = "IMAP Password"
    , imapPasswordPlaceholder = "Password"
    , ssl = "SSL"
    , ignoreCertCheck = "Ignore certificate check"
    , enableOAuth2 = "Enable OAuth2 authentication"
    , oauth2Info = "Enabling this, allows to connect via XOAuth using the password as access token."
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , sslTypeLabel = Messages.Data.SSLType.gb
    , connectionNamePlaceholder = "Názov spojenia, napr. 'gmail.com'"
    , connectionNameInfo = "Názov pripojenia nesmie obsahovať medzery ani špeciálne znaky."
    , imapHost = "Hostiteľ IMAP"
    , imapHostPlaceholder = "Názov hostiteľa IMAP, napr. 'mail.gmail.com'"
    , imapPort = "Port IMAP"
    , imapUser = "Používateľ IMAP"
    , imapUserPlaceholder = "Používateľské meno IMAP, napr. 'vase.meno@gmail.com'"
    , imapPassword = "Heslo IMAP"
    , imapPasswordPlaceholder = "heslo"
    , ssl = "SSL"
    , ignoreCertCheck = "Ignorovať kontrolu certifikátu"
    , enableOAuth2 = "Povoliť overenie OAuth2"
    , oauth2Info = "Ak to povolíte, budete sa môcť pripojiť cez XOAuth pomocou hesla ako prístupového tokenu."
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , sslTypeLabel = Messages.Data.SSLType.de
    , connectionNamePlaceholder = "Name der Verbindung, z.B. 'gmail.com'"
    , connectionNameInfo = "Der Name muss eine gültige ID sein, es dürfen keine Leer- oder Sonderzeichen verwendet werden."
    , imapHost = "IMAP-Server"
    , imapHostPlaceholder = "IMAP-Servername, z.B. 'mail.gmail.com'"
    , imapPort = "IMAP-Port"
    , imapUser = "IMAP-Benutzer"
    , imapUserPlaceholder = "IMAP-Benutzername, z.B. 'your.name@gmail.com'"
    , imapPassword = "IMAP-Passwort"
    , imapPasswordPlaceholder = "Passwort"
    , ssl = "SSL"
    , ignoreCertCheck = "Zertifikatprüfung ignorieren"
    , enableOAuth2 = "Aktiviere OAuth2-Authentifizierung"
    , oauth2Info = "Wenn dies aktiviert ist, wird via XOAuth authentifiziert wobei das Passwort als Access-Token verwendet wird."
    }


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , sslTypeLabel = Messages.Data.SSLType.fr
    , connectionNamePlaceholder = "Nom de la connexion ex: gmail.com"
    , connectionNameInfo = "Le nom de la connexion ne doit contenir i espace ni caractères spéciaux"
    , imapHost = "Hôte IMAP"
    , imapHostPlaceholder = "Nom de l'hôte IMAP ex: 'mail.gmail.com'"
    , imapPort = "Port IMAP"
    , imapUser = "Utilisateur IMAP"
    , imapUserPlaceholder = "Identifiant IMAP, ex: 'your.name@gmail.com'"
    , imapPassword = "Mot de passe IMAP"
    , imapPasswordPlaceholder = "Mot de passe"
    , ssl = "SSL"
    , ignoreCertCheck = "Ignorer la vérification des certificats"
    , enableOAuth2 = "Activer l'authentification OAuth2"
    , oauth2Info = "Ceci permet la connexion via XOAuth en utilisant le mot de passe comme token d'accès"
    }
