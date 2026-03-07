module Page.Languages exposing (view)

import Css
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
            [ CssUtil.container
            , CssUtil.roundedLg
            , CssUtil.shadowMd
            , CssUtil.backgroundColor Theme.color.surface
            , Css.marginTop (Css.px 40)
            , Css.marginBottom (Css.px 40)
            , Css.padding (Css.px 32)
            ]
        ]
        [ Html.div
            [ Attributes.css [ CssUtil.flex, CssUtil.gap 40, CssUtil.justifyCenter, CssUtil.flexRow, Css.flexWrap Css.wrap ] ]
            (List.map (toCircle >> Molecule.LanguageCircle.view) langs)
        ]
