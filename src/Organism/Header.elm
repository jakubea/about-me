module Organism.Header exposing (view)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Types exposing (CvData)
import Util.Css as CssUtil


view : CvData -> Html msg
view cvData =
    Html.header
        [ Attributes.css
            [ CssUtil.backgroundColor Theme.color.background
            , CssUtil.borderBottom Theme.color.border 1
            , Css.padding2 (Css.px 48) (Css.px 16)
            ]
        ]
        [ Html.div
            [ Attributes.css
                [ CssUtil.container
                , CssUtil.flexRow
                , CssUtil.itemsCenter
                , CssUtil.textCenter
                ]
            ]
            [ Html.div
                [ Attributes.css
                    [ CssUtil.container
                    , CssUtil.flexColumn
                    , CssUtil.itemsCenter
                    , CssUtil.textCenter
                    , Css.marginTop (Css.px 32)
                    ]
                ]
                [ Html.h1
                    [ Attributes.css
                        [ Css.fontSize (Css.px Theme.fontSize.xxl)
                        , Css.fontWeight (Css.int 700)
                        , Css.margin (Css.px 0)
                        , Css.marginBottom (Css.px 8)
                        , CssUtil.color Theme.color.text
                        ]
                    ]
                    [ Html.text cvData.name ]
                , Html.p
                    [ Attributes.css
                        [ Css.fontSize (Css.px Theme.fontSize.lg)
                        , CssUtil.color Theme.color.accent
                        , Css.fontWeight (Css.int 700)
                        , Css.margin (Css.px 0)
                        , Css.marginBottom (Css.px 20)
                        ]
                    ]
                    [ Html.text cvData.title ]
                , Html.p
                    [ Attributes.css
                        [ Css.fontSize (Css.px Theme.fontSize.md)
                        , CssUtil.color Theme.color.textLight
                        , Css.margin (Css.px 0)
                        , Css.lineHeight (Css.num 1.8)
                        , Css.maxWidth (Css.px 550)
                        ]
                    ]
                    [ Html.text cvData.summary ]
                ]
            , Html.div
                [ Attributes.css
                    [ Css.width (Css.px 360)
                    , Css.height (Css.px 360)
                    , Css.backgroundColor Theme.color.primary
                    , Css.borderRadius (Css.pct 50)
                    , Css.displayFlex
                    , Css.alignItems Css.center
                    , Css.justifyContent Css.center
                    , Css.overflow Css.hidden
                    ]
                ]
                [ Html.img
                    [ Attributes.src cvData.profileImage
                    , Attributes.alt "Profile photo"
                    , Attributes.css
                        [ Css.width (Css.pct 100)
                        , Css.height (Css.px 360)
                        , Css.property "object-fit" "contain"
                        , CssUtil.roundedLg
                        , CssUtil.shadowMd
                        ]
                    ]
                    []
                ]
            ]
        ]
