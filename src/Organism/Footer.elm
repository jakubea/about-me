module Organism.Footer exposing (view)

import Atom.Icon as Icon
import Atom.Link as Link
import Atom.Text as Text
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Types exposing (CvData)
import Util.Css as CssUtil
import Util.Layout as Layout


view : CvData -> Html msg
view cvData =
    Html.footer
        [ Attributes.css
            [ CssUtil.backgroundColor Theme.color.primary
            , CssUtil.borderTop Theme.color.border 1
            , CssUtil.padding2 40 16
            , CssUtil.property "background-image" "linear-gradient(180deg, #000 0%, #232326 100%)"
            , CssUtil.widthPct 100
            , Layout.flexDirectionColumn
            , Layout.displayFlex
            ]
        ]
        [ Layout.flexRow
            [ Layout.justifyContentSpaceBetween
            , CssUtil.paddingBottom 40
            , Layout.alignItemsCenter
            , CssUtil.maxWidth 1000
            , CssUtil.widthPct 100
            , CssUtil.borderBottom Theme.color.border 1
            , Layout.alignSelfCenter
            ]
            [ Layout.flexColumn [ CssUtil.gapPx 10 ]
                [ Layout.flexRow [ CssUtil.gapPx 8 ] [ Icon.mail, Text.view [ Text.regular ] cvData.contact.email ]
                    |> Link.navLink ("mailto:" ++ cvData.contact.email)
                        False
                        [ CssUtil.color Theme.color.textLight
                        , CssUtil.hover [ CssUtil.textDecorationUnderline, CssUtil.color Theme.color.accent ]
                        ]
                , Layout.flexRow [ CssUtil.gapPx 8 ] [ Icon.phone, Text.view [ Text.regular ] cvData.contact.phone ]
                    |> Link.navLink ("tel:" ++ cvData.contact.phone)
                        False
                        [ CssUtil.color Theme.color.textLight
                        , CssUtil.hover [ CssUtil.textDecorationUnderline, CssUtil.color Theme.color.accent ]
                        ]
                , Layout.flexRow [ Layout.alignItemsCenter, CssUtil.gapPx 8 ]
                    [ Icon.mapPin, Text.view [ Text.regular ] cvData.contact.location ]
                    |> Link.externalLink "https://maps.app.goo.gl/T911joMC6EY5BW6P6"
                        [ CssUtil.color Theme.color.textLight
                        , CssUtil.hover [ CssUtil.textDecorationUnderline, CssUtil.color Theme.color.accent ]
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
                                , CssUtil.hover
                                    [ CssUtil.backgroundColor Theme.color.accent
                                    , CssUtil.color Theme.color.white
                                    ]
                                , CssUtil.focus
                                    [ CssUtil.outline3 2 Theme.color.accent
                                    , CssUtil.outlineOffsetPx 2
                                    ]
                                ]
                        in
                        if link.label == "GitHub" then
                            Link.externalLinkWithLabel link.url "GitHub profile (opens in a new tab)" style Icon.github

                        else if link.label == "LinkedIn" then
                            Link.externalLinkWithLabel link.url "LinkedIn profile (opens in a new tab)" style Icon.linkedin

                        else
                            Html.text link.label
                    )
                    cvData.contact.links
                )
            ]
        , Layout.flexRow
            [ CssUtil.textAlignCenter
            , CssUtil.paddingTop 20
            , Layout.justifyContentCenter
            , CssUtil.gapPx 4
            , Layout.alignItemsCenter
            ]
            [ Text.view [ Text.grayLight, Text.small ] "© 2026. Made with "
            , Html.span [ Attributes.css [ CssUtil.color Theme.color.accent ] ] [ Icon.heart ]
            , Text.view [ Text.grayLight, Text.small ] "and Elm."
            ]
        ]
