{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.BookmarkManage exposing
    ( Texts
    , de
    , fr
    , gb
    , sk
    )

import Http
import Messages.Basics
import Messages.Comp.BookmarkQueryForm
import Messages.Comp.BookmarkTable
import Messages.Comp.HttpError


type alias Texts =
    { basics : Messages.Basics.Texts
    , bookmarkTable : Messages.Comp.BookmarkTable.Texts
    , bookmarkForm : Messages.Comp.BookmarkQueryForm.Texts
    , httpError : Http.Error -> String
    , newBookmark : String
    , reallyDeleteBookmark : String
    , createNewBookmark : String
    , deleteThisBookmark : String
    , correctFormErrors : String
    , userBookmarks : String
    , collectiveBookmarks : String
    }


gb : Texts
gb =
    { basics = Messages.Basics.gb
    , bookmarkTable = Messages.Comp.BookmarkTable.gb
    , bookmarkForm = Messages.Comp.BookmarkQueryForm.gb
    , httpError = Messages.Comp.HttpError.gb
    , newBookmark = "New bookmark"
    , reallyDeleteBookmark = "Really delete this bookmark?"
    , createNewBookmark = "Create new bookmark"
    , deleteThisBookmark = "Delete this bookmark"
    , correctFormErrors = "Please correct the errors in the form."
    , userBookmarks = "Personal bookmarks"
    , collectiveBookmarks = "Collective bookmarks"
    }



sk : Texts
sk =
    { basics = Messages.Basics.sk
    , bookmarkTable = Messages.Comp.BookmarkTable.sk
    , bookmarkForm = Messages.Comp.BookmarkQueryForm.sk
    , httpError = Messages.Comp.HttpError.sk
    , newBookmark = "Nová záložka"
    , reallyDeleteBookmark = "Naozaj odstrániť túto záložku?"
    , createNewBookmark = "Vytvorte si novú záložku"
    , deleteThisBookmark = "Odstrániť túto záložku"
    , correctFormErrors = "Opravte chyby vo formulári."
    , userBookmarks = "Osobné záložky"
    , collectiveBookmarks = "Hromadné záložky"
    }


de : Texts
de =
    { basics = Messages.Basics.de
    , bookmarkTable = Messages.Comp.BookmarkTable.de
    , bookmarkForm = Messages.Comp.BookmarkQueryForm.de
    , httpError = Messages.Comp.HttpError.de
    , newBookmark = "Neue Freigabe"
    , reallyDeleteBookmark = "Diese Freigabe wirklich entfernen?"
    , createNewBookmark = "Neue Freigabe erstellen"
    , deleteThisBookmark = "Freigabe löschen"
    , correctFormErrors = "Bitte korrigiere die Fehler im Formular."
    , userBookmarks = "Persönliche Bookmarks"
    , collectiveBookmarks = "Kollektivbookmarks"
    }


fr : Texts
fr =
    { basics = Messages.Basics.fr
    , bookmarkTable = Messages.Comp.BookmarkTable.fr
    , bookmarkForm = Messages.Comp.BookmarkQueryForm.fr
    , httpError = Messages.Comp.HttpError.fr
    , newBookmark = "Nouveau favori"
    , reallyDeleteBookmark = "Confirmer la suppression de ce  favori ?"
    , createNewBookmark = "Créer un nouveau favori"
    , deleteThisBookmark = "Supprimer ce favori"
    , correctFormErrors = "Veuillez corriger les erreurs du formulaire"
    , userBookmarks = "Favoris personnels"
    , collectiveBookmarks = "Favoris de groupe"
    }
