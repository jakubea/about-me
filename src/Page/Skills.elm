module Page.Skills exposing (view)

import Atom.Heading as Heading
import Atom.Layout as Layout
import Html.Styled exposing (Html)
import Molecule.SkillGroup as SkillGroup
import Types exposing (CvData)
import Util.Css as CssUtil


view : CvData -> Html msg
view cvData =
    Layout.flexColumn [ CssUtil.gapPx 24 ]
        [ String.toUpper "Skills" |> Heading.h2
        , List.map SkillGroup.view cvData.skills |> Layout.flexColumn []
        ]
