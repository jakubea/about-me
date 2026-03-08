module Organism.Footer exposing (view)

import Atom.Icon as Icon
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Types exposing (CvData)
import Util.Css as CssUtil


view : CvData -> Html msg
view cvData =
    Html.footer
        [ Attributes.css
            [ CssUtil.backgroundColor Theme.color.primary
            , CssUtil.borderTop Theme.color.border 1
            , CssUtil.paddingTop 40
            , CssUtil.paddingBottom 40
            , CssUtil.paddingLeft 16
            , CssUtil.paddingRight 16
            , CssUtil.color Theme.color.textLight
            , CssUtil.fontSize Theme.fontSize.sm
            , CssUtil.property "background-image" "linear-gradient(180deg, #000 0%, #232326 100%)"
            ]
        ]
        [ Html.div
            [ Attributes.css
                [ CssUtil.container
                , CssUtil.flexColumn
                , CssUtil.gapPx 28
                ]
            ]
            [ Html.div
                [ Attributes.css
                    [ CssUtil.flex
                    , CssUtil.flexWrapWrap
                    , CssUtil.gapPx 20
                    , CssUtil.justifyContentSpaceBetween
                    , CssUtil.itemsCenter
                    ]
                ]
                [ Html.div
                    [ Attributes.css [ CssUtil.flexColumn, CssUtil.gapPx 12 ] ]
                    [ Html.a
                        [ Attributes.href ("mailto:" ++ cvData.contact.email)
                        , Attributes.css
                            [ CssUtil.color Theme.color.textLight
                            , Css.textDecoration Css.none
                            , CssUtil.flex
                            , CssUtil.itemsCenter
                            , CssUtil.gapPx 10
                            , CssUtil.transition [ "color" ]
                            , Css.hover [ Css.textDecoration Css.underline, CssUtil.color Theme.color.accent ]
                            ]
                        ]
                        [ Icon.mail, Html.text cvData.contact.email ]
                    , Html.a
                        [ Attributes.href ("tel:" ++ cvData.contact.phone)
                        , Attributes.css
                            [ CssUtil.color Theme.color.textLight
                            , Css.textDecoration Css.none
                            , CssUtil.flex
                            , CssUtil.itemsCenter
                            , CssUtil.gapPx 10
                            , CssUtil.transition [ "color" ]
                            , Css.hover [ Css.textDecoration Css.underline, CssUtil.color Theme.color.accent ]
                            ]
                        ]
                        [ Icon.phone, Html.text cvData.contact.phone ]
                    , Html.div
                        [ Attributes.css
                            [ CssUtil.flex
                            , CssUtil.itemsCenter
                            , CssUtil.gapPx 10
                            , CssUtil.color Theme.color.textLight
                            ]
                        ]
                        [ Icon.mapPin, Html.text cvData.contact.location ]
                    ]
                , Html.div
                    [ Attributes.css [ CssUtil.flex, CssUtil.gapPx 10 ] ]
                    (List.map
                        (\link ->
                            Html.a
                                [ Attributes.href link.url
                                , Attributes.target "_blank"
                                , Attributes.rel "noopener noreferrer"
                                , Attributes.css
                                    [ CssUtil.width 40
                                    , Css.height (Css.px 40)
                                    , CssUtil.roundedLg
                                    , CssUtil.backgroundColor Theme.color.gray
                                    , CssUtil.color Theme.color.text
                                    , CssUtil.flex
                                    , CssUtil.itemsCenter
                                    , CssUtil.justifyContentCenter
                                    , CssUtil.transition [ "background-color", "color" ]
                                    , Css.hover
                                        [ CssUtil.backgroundColor Theme.color.primary
                                        , CssUtil.color Theme.color.white
                                        ]
                                    , Css.focus
                                        [ CssUtil.outline3 2 Theme.color.primary
                                        , Css.outlineOffset (Css.px 2)
                                        ]
                                    ]
                                , Attributes.title link.label
                                , Attributes.attribute "aria-label" link.label
                                ]
                                [ if link.label == "GitHub" then
                                    Icon.github

                                  else if link.label == "LinkedIn" then
                                    Icon.linkedin

                                  else
                                    Html.text link.label
                                ]
                        )
                        cvData.contact.links
                    )
                ]
            , Html.div
                [ Attributes.css
                    [ CssUtil.textAlignCenter
                    , CssUtil.paddingTop 20
                    , CssUtil.borderTop Theme.color.border 1
                    , CssUtil.fontSize Theme.fontSize.xs
                    , CssUtil.color Theme.color.textLight
                    ]
                ]
                [ Html.text "© 2026. Made with "
                , Html.span [ Attributes.css [ CssUtil.color Theme.color.accent, CssUtil.marginLeft 4, Css.marginRight (Css.px 4) ] ] [ Icon.heart ]
                , Html.text "and Elm."
                ]
            ]
        ]
