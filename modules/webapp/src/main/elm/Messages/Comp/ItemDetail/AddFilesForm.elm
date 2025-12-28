{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.ItemDetail.AddFilesForm exposing
    ( Texts
    , de
    , fr
    , gb
    , sk
    )

import Messages.Basics
import Messages.Comp.Dropzone


type alias Texts =
    { dropzone : Messages.Comp.Dropzone.Texts
    , basics : Messages.Basics.Texts
    , addMoreFilesToItem : String
    , reset : String
    , filesSubmittedInfo : String
    , refreshNow : String
    }


gb : Texts
gb =
    { dropzone = Messages.Comp.Dropzone.gb
    , basics = Messages.Basics.gb
    , addMoreFilesToItem = "Add more files to this item"
    , reset = "Reset"
    , filesSubmittedInfo =
        "All files have been uploaded. They are being processed, some data "
            ++ "may not be available immediately. "
    , refreshNow = "Refresh now"
    }



sk : Texts
sk =
    { dropzone = Messages.Comp.Dropzone.sk
    , basics = Messages.Basics.sk
    , addMoreFilesToItem = "Pridajte k tejto položke ďalšie súbory"
    , reset = "Resetovať"
    , filesSubmittedInfo = "Všetky súbory boli odovzdané. Spracúvajú sa, nejaké údaje"
            ++ "may not be available immediately. "
    , refreshNow = "Obnovte teraz"
    }


de : Texts
de =
    { dropzone = Messages.Comp.Dropzone.de
    , basics = Messages.Basics.de
    , addMoreFilesToItem = "Weitere Anhänge hinzufügen"
    , reset = "Zurücksetzen"
    , filesSubmittedInfo =
        "Alle Dateien wurden hochgeladen und werden jetzt verarbeitet. Einige Daten "
            ++ "sind evtl. noch nicht sofort verfügbar. "
    , refreshNow = "Neu laden"
    }


fr : Texts
fr =
    { dropzone = Messages.Comp.Dropzone.fr
    , basics = Messages.Basics.fr
    , addMoreFilesToItem = "Ajouter plus de fichier à ce document"
    , reset = "Reset"
    , filesSubmittedInfo =
        "Tous les fichiers ont été importés. Ils sont en cours de traitement, certains"
            ++ "peuvent ne pas être immédiatement disponible. "
    , refreshNow = "Rafraichir maintenant"
    }
