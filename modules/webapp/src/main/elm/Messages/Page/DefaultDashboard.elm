{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Page.DefaultDashboard exposing (Texts, de, fr, gb
    , sk)

import Messages.Basics


type alias Texts =
    { basics : Messages.Basics.Texts
    , default : String
    , welcomeName : String
    , welcomeTitle : String
    , welcomeBody : String
    , summaryName : String
    , dueInDays : Int -> String
    , newDocsName : String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , default = "Default"
    , welcomeName = "Welcome Message"
    , welcomeTitle = "# Welcome to Docspell"
    , welcomeBody = "Docspell keeps your documents organized."
    , summaryName = "Summary"
    , dueInDays = \n -> "Due in " ++ String.fromInt n ++ " days"
    , newDocsName = "New Documents"
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , default = "Predvolené"
    , welcomeName = "Uvítacia správa"
    , welcomeTitle = "# Vitajte v Docspell"
    , welcomeBody = "Docspell udržiava vaše dokumenty organizované."
    , summaryName = "Zhrnutie"
    , dueInDays = \n ->
            "Splatné v" ++ String.fromInt n ++ " days"
    , newDocsName = "Nové dokumenty"
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , default = "Standard"
    , welcomeName = "Willkommens-Nachricht"
    , welcomeTitle = "# Willkommen zu Docspell"
    , welcomeBody = "Docspell behält die Übersicht über deine Dokumente."
    , summaryName = "Zahlen"
    , dueInDays = \n -> "Fällig in " ++ String.fromInt n ++ " Tagen"
    , newDocsName = "Neue Dokumente"
    }


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , default = "Défaut"
    , welcomeName = "Message de bienvenue"
    , welcomeTitle = "# Bienvenue sur  Docspell"
    , welcomeBody = "Docspell garde vos documents organisés"
    , summaryName = "Résumé"
    , dueInDays = \n -> "Échéance dans " ++ String.fromInt n ++ " jours"
    , newDocsName = "Nouveaux documents"
    }
