module Page.Languages exposing (view)

import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Molecule.LanguageCircle
import Molecule.SectionHeading as SectionHeading
import Theme
import Types exposing (CvData)
import Util.Css as CssUtil
import Util.Layout as Layout
import Util.Motion as Motion


view : CvData -> Html msg
view cvData =
    let
        langs =
            cvData.languages

        toCircle index lang =
            { percent = lang.percent
            , label = lang.name
            , delayMs = toFloat (index * 90)
            }
    in
    Html.section
        [ Attributes.css
            [ CssUtil.padding 40, Layout.flexInt 1 ]
        ]
        [ Layout.flexColumn [ CssUtil.gapPx 32 ]
            [ SectionHeading.view "Languages"
            , Html.div
                [ Attributes.css (Motion.revealStyle "translate3d(0, 12px, 0) scale(0.99)" 620 110) ]
                [ Layout.flexRow
                    [ CssUtil.roundedLg
                    , CssUtil.shadowMd
                    , CssUtil.backgroundColor Theme.color.surface
                    , CssUtil.padding2 30 0
                    , CssUtil.gapPx 40
                    , Layout.justifyContentCenter
                    , Layout.flexWrapWrap
                    ]
                    (List.indexedMap toCircle langs |> List.map Molecule.LanguageCircle.view)
                ]
            ]
        ]
