{-
   Copyright 2020 Eike K. & Contributors

   SPDX-License-Identifier: AGPL-3.0-or-later
-}


module Messages.Comp.ExpandCollapse exposing
    ( Texts
    , de
    , fr
    , gb
    , sk
    )


type alias Texts =
    { showMoreLabel : String
    , showLessLabel : String
    }


gb : Texts
gb =
    { showMoreLabel = "Show More …"
    , showLessLabel = "Show Less …"
    }



sk : Texts
sk =
    { showMoreLabel = "Zobraziť viac…"
    , showLessLabel = "Zobraziť menej…"
    }


de : Texts
de =
    { showMoreLabel = "Mehr …"
    , showLessLabel = "Weniger …"
    }


fr : Texts
fr =
    { showMoreLabel = "Voir plus..."
    , showLessLabel = "Voir moins..."
    }
