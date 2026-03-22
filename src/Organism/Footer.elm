module Organism.Footer exposing (view)

import Atom.Icon as Icon
import Atom.Layout as Layout
import Atom.Link as Link
import Atom.Text as Text
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
            , CssUtil.padding2 40 16
            , CssUtil.property "background-image" "linear-gradient(180deg, #000 0%, #232326 100%)"
            , CssUtil.widthPct 100
            ]
        ]
        [ Layout.flexRow [ Layout.justifyContentSpaceBetween, CssUtil.paddingBottom 40, Layout.alignItemsCenter ]
            [ Layout.flexColumn [ CssUtil.gapPx 10 ]
                [ Layout.flexRow [ CssUtil.gapPx 8 ] [ Icon.mail, Text.view [ Text.regular ] cvData.contact.email ]
                    |> Link.navLink ("mailto:" ++ cvData.contact.email)
                        False
                        [ CssUtil.color Theme.color.textLight
                        , CssUtil.hover [ Css.textDecoration Css.underline, CssUtil.color Theme.color.accent ]
                        ]
                , Layout.flexRow [ CssUtil.gapPx 8 ] [ Icon.phone, Text.view [ Text.regular ] cvData.contact.phone ]
                    |> Link.navLink ("tel:" ++ cvData.contact.phone)
                        False
                        [ CssUtil.color Theme.color.textLight
                        , CssUtil.hover [ Css.textDecoration Css.underline, CssUtil.color Theme.color.accent ]
                        ]
                , Layout.flexRow [ Layout.alignItemsCenter, CssUtil.gapPx 8 ]
                    [ Icon.mapPin, Text.view [ Text.regular ] cvData.contact.location ]
                    |> Link.externalLink "https://maps.app.goo.gl/T911joMC6EY5BW6P6"
                        [ CssUtil.color Theme.color.textLight
                        , CssUtil.hover [ Css.textDecoration Css.underline, CssUtil.color Theme.color.accent ]
                        ]
                ]
            , Layout.flexRow [ CssUtil.gapPx 10 ]
                (List.map
                    (\link ->
                        let
                            style =
                                [ CssUtil.widthPx 40
                                , CssUtil.heightPx 40
                                , CssUtil.roundedLg
                                , CssUtil.backgroundColor Theme.color.textLight

                                -- , CssUtil.color Theme.color.text
                                , Layout.alignItemsCenter
                                , Layout.displayFlex
                                , Layout.justifyContentCenter
                                , CssUtil.transition [ "background-color", "color" ]
                                , Css.hover
                                    [ CssUtil.backgroundColor Theme.color.accent
                                    , CssUtil.color Theme.color.white
                                    ]
                                , Css.focus
                                    [ CssUtil.outline3 2 Theme.color.accent
                                    , Css.outlineOffset (Css.px 2)
                                    ]
                                ]
                        in
                        -- [ Attributes.href link.url
                        -- , Attributes.target "_blank"
                        -- , Attributes.rel "noopener noreferrer"
                        -- , Attributes.css
                        -- , Attributes.title link.label
                        -- , Attributes.attribute "aria-label" link.label
                        -- ]
                        if link.label == "GitHub" then
                            Link.externalLink link.url style Icon.github

                        else if link.label == "LinkedIn" then
                            Link.externalLink link.url style Icon.linkedin

                        else
                            Html.text link.label
                    )
                    cvData.contact.links
                )
            ]
        , Layout.flexRow
            [ CssUtil.textAlignCenter
            , CssUtil.paddingTop 20
            , CssUtil.borderTop Theme.color.border 1
            , Layout.justifyContentCenter
            , CssUtil.gapPx 4
            , Layout.alignItemsCenter
            ]
            [ Text.view [ Text.grayLight, Text.small ] "© 2026. Made with "
            , Html.span [ Attributes.css [ CssUtil.color Theme.color.accent ] ] [ Icon.heart ]
            , Text.view [ Text.grayLight, Text.small ] "and Elm."
            ]
        ]
