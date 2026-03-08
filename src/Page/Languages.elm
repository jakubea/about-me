module Page.Languages exposing (view)

import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Molecule.LanguageCircle
import Theme
import Types exposing (CvData)
import Util.Css as CssUtil


view : CvData -> Html msg
view cvData =
    let
        langs =
            cvData.languages

        toCircle lang =
            { percent = lang.percent, label = lang.name }
    in
    Html.section
        [ Attributes.css
            [ CssUtil.container, CssUtil.padding 40, CssUtil.flex1 ]
        ]
        [ Html.div
            [ Attributes.css
                [ CssUtil.roundedLg
                , CssUtil.shadowMd
                , CssUtil.backgroundColor Theme.color.surface
                , CssUtil.padding2 30 0
                , CssUtil.flex
                , CssUtil.gapPx 40
                , CssUtil.justifyContentCenter
                , CssUtil.flexRow
                , CssUtil.flexWrapWrap
                ]
            ]
            (List.map (toCircle >> Molecule.LanguageCircle.view) langs)
        ]
