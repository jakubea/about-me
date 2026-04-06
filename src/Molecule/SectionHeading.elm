module Molecule.SectionHeading exposing (view)

import Atom.Heading as Heading
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Util.Css as CssUtil
import Util.Layout as Layout


view : String -> Html msg
view title =
    Layout.flexColumn
        [ CssUtil.gapPx 14
        , CssUtil.paddingBottom 18
        , CssUtil.borderBottom Theme.color.surface 1
        ]
        [ Html.span
            [ Attributes.css
                [ Layout.displayBlock
                , CssUtil.widthPx 56
                , CssUtil.heightPx 3
                , CssUtil.borderRadius 999
                , CssUtil.backgroundColor Theme.color.accent
                ]
            ]
            []
        , String.toUpper title |> Heading.h2
        ]
