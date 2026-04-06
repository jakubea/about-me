module Page.Experience exposing (view)

import Atom.Heading as Heading
import Html.Styled exposing (Html)
import I18n
import Molecule.ExperienceCard as ExperienceCard
import Types exposing (CvData)
import Util.Css as CssUtil
import Util.Layout as Layout


translateFn : I18n.Translators -> String -> String
translateFn translators =
    I18n.translateFn translators "Page.Experience."


view : I18n.Translators -> CvData -> Html msg
view translators cvData =
    Layout.flexColumn [ CssUtil.gapPx 24 ]
        [ translateFn translators "experience" |> String.toUpper |> Heading.h2
        , Layout.flexColumn [ CssUtil.gapPx 16 ]
            (List.map ExperienceCard.view cvData.experiences)
        ]
