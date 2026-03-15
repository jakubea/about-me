module Molecule.ExperienceCard exposing (view)

import Atom.Heading as Heading
import Atom.Text as Text
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Molecule.Badge as Badge
import Molecule.Card as Card
import Theme
import Types exposing (Experience)
import Util.Css as CssUtil


view : Experience -> Html msg
view experience =
    Card.viewWithBorder
        [ Heading.h3 experience.position
        , Html.p
            [ Attributes.css
                [ CssUtil.color Theme.color.textLight
                , CssUtil.fontSize 14
                , CssUtil.fontWeight 600
                , CssUtil.margin 0
                , CssUtil.marginBottom 4
                ]
            ]
            [ Html.text experience.company ]
        , Html.p
            [ Attributes.css
                [ CssUtil.color Theme.color.textLight
                , CssUtil.fontSize 12
                , CssUtil.margin 0
                , CssUtil.marginBottom 12
                ]
            ]
            [ Html.text (experience.startDate ++ " - " ++ experience.endDate) ]
        , List.map (Text.view [] >> List.singleton >> Html.li []) experience.description |> Html.ul []
        , Html.div
            [ Attributes.css
                [ CssUtil.flexColumn
                , CssUtil.gapPx 8
                , CssUtil.marginTop 16
                ]
            ]
            [ Html.div
                [ Attributes.css
                    [ CssUtil.flex
                    , CssUtil.gapPx 8
                    , CssUtil.flexWrapWrap
                    ]
                ]
                (List.map (Badge.view Badge.Black) experience.technologies)
            ]
        ]
