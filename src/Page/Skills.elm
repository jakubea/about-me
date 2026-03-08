module Page.Skills exposing (view)

import Atom.Heading as Heading
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Molecule.SkillGroup as SkillGroup
import Types exposing (CvData)
import Util.Css as CssUtil


view : CvData -> Html msg
view cvData =
    Heading.h2 "Skills"
        :: List.map SkillGroup.view cvData.skills
        |> Html.div
            [ Attributes.css
                [ CssUtil.padding 24
                , CssUtil.maxWidth 900
                , CssUtil.gapPx 20
                ]
            ]
