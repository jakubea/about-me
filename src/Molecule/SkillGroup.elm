module Molecule.SkillGroup exposing (view)

import Atom.Heading as Heading
import Atom.Layout as Layout
import Html.Styled exposing (Html)
import Molecule.Badge as Badge
import Theme
import Types exposing (Skill)
import Util.Css as CssUtil


view : Skill -> Html msg
view { category, items } =
    Layout.flexColumn [ CssUtil.borderBottom Theme.color.white 1, CssUtil.lastChild [ CssUtil.borderBottom Theme.color.white 0 ], CssUtil.padding2 20 0, CssUtil.gapPx 5 ]
        [ Heading.h3 category
        , List.map (Badge.view Badge.White) items
            |> Layout.flexRow [ CssUtil.gapPx 8, Layout.flexWrapWrap ]
        ]
