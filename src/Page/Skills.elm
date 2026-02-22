module Page.Skills exposing (view)

import Atom.Heading as Heading
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Molecule.SkillGroup as SkillGroup
import Types exposing (CvData)
import Util.Css as CssUtil


view : CvData -> Html msg
view cvData =
    Html.div
        [ Attributes.css
            [ CssUtil.padding 24
            , Css.maxWidth (Css.px 900)
            , CssUtil.marginLeftAuto
            , Css.marginRight Css.auto
            ]
        ]
        [ Heading.h2 "Skills"
        , Html.div
            [ Attributes.css
                [ CssUtil.marginTop 24
                ]
            ]
            (List.map SkillGroup.view cvData.skills)
        ]
