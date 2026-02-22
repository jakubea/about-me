module Page.Projects exposing (view)

import Atom.Heading as Heading
import Css
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
            , Css.maxWidth (Css.px 900)
            , Css.marginLeft Css.auto
            , Css.marginRight Css.auto
            ]
        ]
        [ Heading.h2 "Projects"
        , Html.div
            [ Attributes.css
                [ CssUtil.flexColumn
                , CssUtil.gap 16
                , CssUtil.marginTop 24
                ]
            ]
            (List.map ProjectCard.view cvData.projects)
        ]
