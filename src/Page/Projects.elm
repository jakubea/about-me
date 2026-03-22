module Page.Projects exposing (view)

import Atom.Heading as Heading
import Atom.Layout as Layout
import Html.Styled as Html exposing (Html)
import Molecule.ProjectCard as ProjectCard
import Types exposing (CvData)
import Util.Css as CssUtil


view : CvData -> Html msg
view cvData =
    Layout.flexColumn [ CssUtil.gapPx 24 ]
        [ String.toUpper "Projects" |> Heading.h2
        , Html.text cvData.projects.description
        , Layout.flexColumn
            [ CssUtil.gapPx 16
            , CssUtil.marginTop 24
            ]
            (List.map ProjectCard.view cvData.projects.githubProjects)
        ]
