module Page.Skills exposing (view)

import Html.Styled exposing (Html)
import Molecule.SectionHeading as SectionHeading
import Molecule.SkillGroup as SkillGroup
import Types exposing (CvData)
import Util.Css as CssUtil
import Util.Layout as Layout
import Util.Motion as Motion


view : CvData -> Html msg
view cvData =
    Layout.flexColumn [ CssUtil.gapPx 32 ]
        [ SectionHeading.view "Skills"
        , List.indexedMap
            (\index skill ->
                Layout.flexColumn (Motion.revealStyle "translate3d(-14px, 0, 0)" 500 (toFloat (70 + (index * 65)))) [ SkillGroup.view skill ]
            )
            cvData.skills
            |> Layout.flexColumn []
        ]
