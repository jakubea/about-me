module Page.Experience exposing (view)

import Html.Styled exposing (Html)
import I18n
import Molecule.ExperienceCard as ExperienceCard
import Molecule.SectionHeading as SectionHeading
import Types exposing (CvData)
import Util.Css as CssUtil
import Util.Layout as Layout
import Util.Motion as Motion


translateFn : I18n.Translators -> String -> String
translateFn translators =
    I18n.translateFn translators "Page.Experience."


view : I18n.Translators -> CvData -> Html msg
view translators cvData =
    Layout.flexColumn [ CssUtil.gapPx 32, CssUtil.maxWidth 940 ]
        [ SectionHeading.view (translateFn translators "experience")
        , Layout.flexColumn [ CssUtil.gapPx 24 ]
            (cvData.experiences
                |> List.indexedMap
                    (\index experience ->
                        Layout.flexColumn
                            (Motion.revealStyle "translate3d(-18px, 0, 0)" 560 (toFloat (110 + (index * 95))))
                            [ ExperienceCard.view experience ]
                    )
            )
        ]
