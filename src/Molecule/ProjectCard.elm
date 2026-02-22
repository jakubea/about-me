module Molecule.ProjectCard exposing (view)

import Atom.Heading as Heading
import Atom.Link as Link
import Atom.Text as Text
import Css
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
        , Text.view project.description
        , Html.div
            [ Attributes.css
                [ CssUtil.flexColumn
                , CssUtil.gap Theme.spacing.md
                , CssUtil.marginTop Theme.spacing.md
                ]
            ]
            [ Html.div
                []
                [ Html.p
                    [ Attributes.css
                        [ CssUtil.margin 0
                        , CssUtil.marginBottom 4
                        , Css.fontSize (Css.px 12)
                        , Css.fontWeight (Css.int 600)
                        , CssUtil.color Theme.color.primary
                        ]
                    ]
                    [ Html.text "Technologies:" ]
                , Html.div
                    [ Attributes.css
                        [ CssUtil.flex
                        , CssUtil.gap Theme.spacing.sm
                        , Css.flexWrap Css.wrap
                        ]
                    ]
                    (List.map Badge.view project.technologies)
                ]
            , if List.isEmpty project.highlights then
                Html.text ""

              else
                Html.div
                    []
                    [ Html.p
                        [ Attributes.css
                            [ CssUtil.margin 0
                            , CssUtil.marginBottom 4
                            , Css.fontSize (Css.px 12)
                            , Css.fontWeight (Css.int 600)
                            , CssUtil.color Theme.color.primary
                            ]
                        ]
                        [ Html.text "Highlights:" ]
                    , Html.ul
                        [ Attributes.css
                            [ CssUtil.marginBottom 0
                            , CssUtil.marginTop 0
                            , CssUtil.padding Theme.spacing.md
                            ]
                        ]
                        (List.map highlightItem project.highlights)
                    ]
            , case project.link of
                Just url ->
                    Html.div
                        [ Attributes.css [ CssUtil.marginTop Theme.spacing.md ] ]
                        [ Link.viewExternal "View Project →" url ]

                Nothing ->
                    Html.text ""
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
        [ Html.text text ]
