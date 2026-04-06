module Page.Projects exposing (view)

import Atom.Text as Text
import Html.Styled exposing (Html)
import Molecule.ProjectCard as ProjectCard
import Molecule.SectionHeading as SectionHeading
import Types exposing (CvData)
import Util.Css as CssUtil
import Util.Layout as Layout
import Util.Motion as Motion


view : CvData -> Html msg
view cvData =
    Layout.flexColumn [ CssUtil.gapPx 32 ]
        [ SectionHeading.view "Projects"
        , Layout.flexColumn (Motion.revealStyle "translate3d(0, 10px, 0)" 520 90)
            [ Text.view [] cvData.projects.description ]
        , Layout.flexColumn
            [ CssUtil.gapPx 16
            , CssUtil.marginTop 24
            ]
            (cvData.projects.githubProjects
                |> List.indexedMap
                    (\index project ->
                        Layout.flexColumn
                            (Motion.revealStyle "translate3d(0, 16px, 0) scale(0.985)" 560 (toFloat (150 + (index * 90))))
                            [ ProjectCard.view project ]
                    )
            )
        ]
