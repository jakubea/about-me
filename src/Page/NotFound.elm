module Page.NotFound exposing (view)

import Atom.Heading as Heading
import Atom.Link as Link
import Atom.Text as Text
import Html.Styled exposing (Html)
import Util.Css as CssUtil
import Util.Layout as Layout


view : Html msg
view =
    Layout.flexColumn [ CssUtil.gapPx 24 ]
        [ String.toUpper "Page Not Found" |> Heading.h2
        , Text.view [] "The page you're looking for doesn't exist."
        , Text.view [ Text.grayLight, Text.hoverColor Text.red ] "← Back to Home" |> Link.navLink "/" False []
        ]
