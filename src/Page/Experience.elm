module Page.Experience exposing (view)

import Atom.Heading as Heading
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Molecule.ExperienceCard as ExperienceCard
import Types exposing (CvData)
import Util.Css as CssUtil


view : CvData -> Html msg
view cvData =
    Html.div
        [ Attributes.css
            [ CssUtil.padding 24
            , CssUtil.maxWidth 900
            , CssUtil.marginLeftAuto
            , CssUtil.marginRight 0
            ]
        ]
        [ Heading.h2 "Experience"
        , Html.div
            [ Attributes.css
                [ CssUtil.flexColumn
                , CssUtil.gapPx 16
                , CssUtil.marginTop 24
                ]
            ]
            (List.map ExperienceCard.view cvData.experiences)
        ]
