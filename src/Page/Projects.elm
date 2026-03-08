module Page.Projects exposing (view)

import Atom.Heading as Heading
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Molecule.ProjectCard as ProjectCard
import Types exposing (CvData)
import Util.Css as CssUtil


view : CvData -> Html msg
view cvData =
    Html.div
        [ Attributes.css
            [ CssUtil.padding 24
            , CssUtil.maxWidth 900
            , CssUtil.marginLeftAuto
            , CssUtil.marginRightAuto
            ]
        ]
        [ Heading.h2 "Projects"
        , Html.text cvData.projects.description
        , Html.div
            [ Attributes.css
                [ CssUtil.flexColumn
                , CssUtil.gapPx 16
                , CssUtil.marginTop 24
                ]
            ]
            (List.map ProjectCard.view cvData.projects.githubProjects)
        ]
