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
            , CssUtil.padding2 48 16
            , CssUtil.flex1
            ]
        ]
        [ Html.div
            [ Attributes.css
                [ CssUtil.container
                , CssUtil.flexRow
                , CssUtil.itemsCenter
                , CssUtil.textCenter
                , CssUtil.flexWrapWrap
                , CssUtil.justifyContentCenter
                ]
            ]
            [ Html.div
                [ Attributes.css
                    [ CssUtil.container
                    , CssUtil.flexColumn
                    , CssUtil.itemsCenter
                    , CssUtil.textCenter
                    , CssUtil.marginTop 32
                    ]
                ]
                [ Html.h1
                    [ Attributes.css
                        [ CssUtil.fontSize Theme.fontSize.xxl
                        , CssUtil.fontWeight 700
                        , CssUtil.marginZero
                        , CssUtil.marginBottom 8
                        , CssUtil.color Theme.color.text
                        ]
                    ]
                    [ Html.text cvData.name ]
                , Html.p
                    [ Attributes.css
                        [ CssUtil.fontSize Theme.fontSize.lg
                        , CssUtil.color Theme.color.accent
                        , CssUtil.fontWeight 700
                        , Css.margin (Css.px 0)
                        , Css.marginBottom (Css.px 20)
                        ]
                    ]
                    [ Html.text cvData.title ]
                , List.map (Html.text >> List.singleton >> Html.p []) cvData.summary
                    |> Html.div
                        [ Attributes.css
                            [ CssUtil.fontSize Theme.fontSize.md
                            , CssUtil.color Theme.color.textLight
                            , Css.margin (Css.px 0)
                            , Css.lineHeight (Css.num 1.8)
                            , Css.maxWidth (Css.px 550)
                            , CssUtil.flexColumn
                            ]
                        ]
                ]
            , Html.div
                [ Attributes.css
                    [ CssUtil.widthPct 80
                    , Css.maxWidth (Css.px 360)
                    , Css.height Css.auto
                    , CssUtil.property "aspect-ratio" "1 / 1"
                    , Css.borderRadius (Css.pct 50)
                    , Css.overflow Css.hidden
                    , Css.position Css.relative
                    , Css.backgroundColor Theme.color.primary
                    ]
                ]
                [ Html.img
                    [ Attributes.src cvData.profileImage
                    , Attributes.alt "Profile photo"
                    , Attributes.css
                        [ Css.position Css.absolute
                        , Css.top (Css.px 0)
                        , Css.left (Css.px 0)
                        , CssUtil.widthPct 100
                        , Css.height (Css.pct 100)
                        , CssUtil.property "object-fit" "cover"
                        , CssUtil.property "object-position" "top"
                        , CssUtil.shadowMd
                        ]
                    ]
                    []
                ]
            ]
        ]
