module Molecule.ExperienceCard exposing (view)

import Atom.Heading as Heading
import Atom.Text as Text
import Html.Styled as Html exposing (Html)
import Molecule.Badge as Badge
import Molecule.Card as Card
import Types exposing (Experience)
import Util.Css as CssUtil
import Util.Layout as Layout


view : Experience -> Html msg
view { position, company, endDate, startDate, technologies, description } =
    Card.viewWithBorder
        [ Heading.h3 position
        , Layout.flexRow [ CssUtil.gapPx 6 ]
            [ Text.view [] company
            , String.concat [ "(", startDate, " - ", endDate, ")" ] |> Text.view []
            ]
        , List.map (Text.view [] >> List.singleton >> Html.li []) description |> Html.ul []
        , List.map (Badge.view Badge.Black) technologies
            |> Layout.flexRow [ CssUtil.gapPx 8, Layout.flexWrapWrap ]
        ]
