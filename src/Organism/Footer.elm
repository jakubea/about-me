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
            , Css.paddingTop (Css.px 40)
            , Css.paddingBottom (Css.px 40)
            , Css.paddingLeft (Css.px 16)
            , Css.paddingRight (Css.px 16)
            , CssUtil.color Theme.color.textLight
            , Css.fontSize (Css.px Theme.fontSize.sm)
            , Css.property "background-image" "linear-gradient(180deg, #000 0%, #232326 100%)"
            ]
        ]
        [ Html.div
            [ Attributes.css
                [ CssUtil.container
                , CssUtil.flexColumn
                , CssUtil.gap 28
                ]
            ]
            [ Html.div
                [ Attributes.css
                    [ CssUtil.flex
                    , Css.flexWrap Css.wrap
                    , CssUtil.gap 20
                    , Css.justifyContent Css.spaceBetween
                    , CssUtil.itemsCenter
                    ]
                ]
                [ Html.div
                    [ Attributes.css [ CssUtil.flexColumn, CssUtil.gap 12 ] ]
                    [ Html.a
                        [ Attributes.href ("mailto:" ++ cvData.contact.email)
                        , Attributes.css
                            [ CssUtil.color Theme.color.primary
                            , Css.textDecoration Css.none
                            , CssUtil.flex
                            , CssUtil.itemsCenter
                            , CssUtil.gap 10
                            , CssUtil.transition [ "color" ]
                            , Css.hover [ Css.textDecoration Css.underline, CssUtil.color Theme.color.accent ]
                            ]
                        ]
                        [ Icon.mail, Html.text cvData.contact.email ]
                    , Html.a
                        [ Attributes.href ("tel:" ++ cvData.contact.phone)
                        , Attributes.css
                            [ CssUtil.color Theme.color.primary
                            , Css.textDecoration Css.none
                            , CssUtil.flex
                            , CssUtil.itemsCenter
                            , CssUtil.gap 10
                            , CssUtil.transition [ "color" ]
                            , Css.hover [ Css.textDecoration Css.underline, CssUtil.color Theme.color.accent ]
                            ]
                        ]
                        [ Icon.phone, Html.text cvData.contact.phone ]
                    , Html.div
                        [ Attributes.css
                            [ CssUtil.flex
                            , CssUtil.itemsCenter
                            , CssUtil.gap 10
                            , CssUtil.color Theme.color.primary
                            ]
                        ]
                        [ Icon.mapPin, Html.text cvData.contact.location ]
                    ]
                , Html.div
                    [ Attributes.css [ CssUtil.flex, CssUtil.gap 10 ] ]
                    (List.map
                        (\link ->
                            Html.a
                                [ Attributes.href link.url
                                , Attributes.target "_blank"
                                , Attributes.rel "noopener noreferrer"
                                , Attributes.css
                                    [ Css.width (Css.px 40)
                                    , Css.height (Css.px 40)
                                    , CssUtil.roundedLg
                                    , CssUtil.backgroundColor Theme.color.gray
                                    , CssUtil.color Theme.color.text
                                    , CssUtil.flex
                                    , CssUtil.itemsCenter
                                    , CssUtil.justifyCenter
                                    , CssUtil.transition [ "background-color", "color" ]
                                    , Css.hover
                                        [ CssUtil.backgroundColor Theme.color.primary
                                        , CssUtil.color Theme.color.white
                                        ]
                                    , Css.focus
                                        [ Css.outline3 (Css.px 2) Css.solid Theme.color.primary
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
                    [ Css.textAlign Css.center
                    , Css.paddingTop (Css.px 20)
                    , CssUtil.borderTop Theme.color.border 1
                    , Css.fontSize (Css.px Theme.fontSize.xs)
                    , CssUtil.color Theme.color.textLight
                    ]
                ]
                [ Html.text "© 2026. Made with "
                , Html.span [ Attributes.css [ CssUtil.color Theme.color.primary, Css.marginLeft (Css.px 4), Css.marginRight (Css.px 4) ] ] [ Icon.heart ]
                , Html.text "and Elm."
                ]
            ]
        ]
