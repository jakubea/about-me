module Molecule.ProjectCard exposing (view)

import Atom.Heading as Heading
import Atom.Layout as Layout
import Atom.Link as Link
import Atom.Text as Text
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Molecule.Badge as Badge
import Molecule.Card as Card
import Theme
import Types exposing (Project)
import Util.Css as CssUtil


view : Project -> Html msg
view project =
    Card.viewWithBorder
        [ Heading.h3 project.name
        , Text.view [] project.description
        , Layout.flexColumn
            [ CssUtil.gapPx Theme.spacing.md
            , CssUtil.marginTop Theme.spacing.md
            ]
            [ Layout.flexColumn [ CssUtil.gapPx 5 ]
                [ Text.view [ Text.red, Text.hoverColor Text.red ] "Technologies:"
                , Layout.flexRow
                    [ CssUtil.gapPx Theme.spacing.sm
                    , Layout.flexWrapWrap
                    ]
                    (List.map (Badge.view Badge.Black) project.technologies)
                ]
            , if List.isEmpty project.highlights then
                Text.none

              else
                Layout.flexColumn [ CssUtil.gapPx 5 ]
                    [ Text.view [ Text.red, Text.hoverColor Text.red ] "Highlights:"
                    , List.map highlightItem project.highlights |> Html.ul []
                    ]
            , case project.link of
                Just url ->
                    Text.view [ Text.grayLight, Text.hoverColor Text.red ] "View Project →" |> Link.externalLink url []

                Nothing ->
                    Text.none
            ]
        ]


highlightItem : String -> Html msg
highlightItem text =
    Html.li
        [ Attributes.css
            [ CssUtil.marginBottom Theme.spacing.sm
            , CssUtil.color Theme.color.text
            ]
        ]
        [ Text.view [] text ]
