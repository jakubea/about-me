module Page.Languages exposing (view)

import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Molecule.LanguageCircle
import Theme
import Types exposing (CvData)
import Util.Css as CssUtil
import Util.Layout as Layout


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
            [ CssUtil.padding 40, Layout.flexInt 1 ]
        ]
        [ Layout.flexRow
            [ CssUtil.roundedLg
            , CssUtil.shadowMd
            , CssUtil.backgroundColor Theme.color.surface
            , CssUtil.padding2 30 0
            , CssUtil.gapPx 40
            , Layout.justifyContentCenter
            , Layout.flexWrapWrap
            ]
            (List.map (toCircle >> Molecule.LanguageCircle.view) langs)
        ]
