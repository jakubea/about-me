module Page.Projects exposing (view)

import Atom.Heading as Heading
import Atom.Text as Text
import Html.Styled exposing (Html)
import Molecule.ProjectCard as ProjectCard
import Types exposing (CvData)
import Util.Css as CssUtil
import Util.Layout as Layout


view : CvData -> Html msg
view cvData =
    Layout.flexColumn [ CssUtil.gapPx 24 ]
        [ String.toUpper "Projects" |> Heading.h2
        , Text.view [ Text.small ] cvData.projects.description
        , Layout.flexColumn
            [ CssUtil.gapPx 16
            , CssUtil.marginTop 24
            ]
            (List.map ProjectCard.view cvData.projects.githubProjects)
        ]
