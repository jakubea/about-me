module Page.Experience exposing (view)

import Atom.Heading as Heading
import Html.Styled exposing (Html)
import Molecule.ExperienceCard as ExperienceCard
import Types exposing (CvData)
import Util.Css as CssUtil
import Util.Layout as Layout


view : CvData -> Html msg
view cvData =
    Layout.flexColumn [ CssUtil.gapPx 24 ]
        [ String.toUpper "Experience" |> Heading.h2
        , Layout.flexColumn [ CssUtil.gapPx 16 ]
            (List.map ExperienceCard.view cvData.experiences)
        ]
