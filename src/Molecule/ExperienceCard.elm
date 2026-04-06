module Molecule.ExperienceCard exposing (view)

import Atom.Heading as Heading
import Atom.Text as Text
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Molecule.Badge as Badge
import Molecule.Card as Card
import Theme
import Types exposing (Experience)
import Util.Css as CssUtil
import Util.Layout as Layout


descriptionListStyle : List Css.Style
descriptionListStyle =
    [ CssUtil.marginZero
    , CssUtil.paddingZero
    , Layout.displayGrid
    , CssUtil.gapPx 12
    ]


descriptionItemStyle : List Css.Style
descriptionItemStyle =
    [ CssUtil.marginZero
    , CssUtil.listStyleNone
    , Layout.displayGrid
    , CssUtil.property "grid-template-columns" "8px minmax(0, 1fr)"
    , CssUtil.gapPx 10
    ]


bulletStyle : List Css.Style
bulletStyle =
    [ Layout.displayInlineBlock
    , CssUtil.widthPx 8
    , CssUtil.heightPx 8
    , CssUtil.minWidthPx 8
    , CssUtil.borderRadiusPct 50
    , CssUtil.backgroundColor Theme.color.accent
    , CssUtil.marginTop 8
    ]


descriptionTextStyle : List Css.Style
descriptionTextStyle =
    [ CssUtil.color Theme.color.textLight
    , CssUtil.lineHeight 1.65
    ]


sectionLabel : String -> Html msg
sectionLabel label =
    Text.view [ Text.small, Text.grayLight, Text.bold ] label


dateBadge : String -> Html msg
dateBadge text =
    Html.span
        [ Attributes.css
            [ Layout.displayInlineBlock
            , CssUtil.padding2 6 10
            , CssUtil.borderRadius 999
            , CssUtil.border Theme.color.border 1
            , CssUtil.property "background" "rgba(255, 45, 45, 0.08)"
            ]
        ]
        [ Text.view [ Text.small ] text ]


descriptionItem : String -> Html msg
descriptionItem text =
    Html.li
        [ Attributes.css descriptionItemStyle ]
        [ Html.span [ Attributes.css bulletStyle ]
            []
        , Html.div [ Attributes.css descriptionTextStyle ]
            [ Html.text text ]
        ]


view : Experience -> Html msg
view { position, company, endDate, startDate, technologies, description } =
    Card.viewWithBorder
        [ Layout.flexColumn
            [ CssUtil.gapPx 10
            , CssUtil.paddingBottom 14
            , CssUtil.property "border-bottom" "1px solid rgba(255, 255, 255, 0.08)"
            ]
            [ Layout.flexRow [ Layout.justifyContentSpaceBetween, Layout.alignItemsCenter, Layout.flexWrapWrap, CssUtil.gapPx 12 ]
                [ Layout.flexColumn [ CssUtil.gapPx 8 ]
                    [ Heading.h3 position
                    , Text.view [ Text.red, Text.bold ] company
                    ]
                , dateBadge (String.concat [ startDate, " - ", endDate ])
                ]
            ]
        , Html.ul
            [ Attributes.css descriptionListStyle ]
            (List.map descriptionItem description)
        , Layout.flexColumn
            [ CssUtil.gapPx 10
            , CssUtil.paddingTop 6
            ]
            [ sectionLabel "Technologies"
            , List.map (Badge.view Badge.Black) technologies
                |> Layout.flexRow [ CssUtil.gapPx 8, Layout.flexWrapWrap ]
            ]
        ]
