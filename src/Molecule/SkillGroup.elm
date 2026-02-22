module Molecule.SkillGroup exposing (view)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Molecule.Badge as Badge
import Theme
import Types exposing (Skill)
import Util.Css as CssUtil


view : Skill -> Html msg
view skill =
    Html.div
        [ Attributes.css
            [ CssUtil.marginBottom 16
            ]
        ]
        [ Html.h3
            [ Attributes.css
                [ CssUtil.color Theme.color.primary
                , CssUtil.fontSize 16
                , CssUtil.fontWeight 600
                , CssUtil.marginBottom 8
                , CssUtil.margin 0
                ]
            ]
            [ Html.text skill.category ]
        , Html.div
            [ Attributes.css
                [ CssUtil.flex
                , CssUtil.gap 8
                , Css.flexWrap Css.wrap
                ]
            ]
            (List.map Badge.view skill.items)
        ]
