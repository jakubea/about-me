module Page.NotFound exposing (view)

import Atom.Link as Link
import Atom.Text as Text
import Html.Styled exposing (Html)
import Molecule.SectionHeading as SectionHeading
import Util.Css as CssUtil
import Util.Layout as Layout


view : Html msg
view =
    Layout.flexColumn [ CssUtil.gapPx 32 ]
        [ SectionHeading.view "Page Not Found"
        , Text.view [] "The page you're looking for doesn't exist."
        , Text.view [ Text.grayLight, Text.hoverColor Text.red ] "← Back to Home" |> Link.navLink "/" False []
        ]
