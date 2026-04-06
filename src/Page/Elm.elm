module Page.Elm exposing (view)

import Css
import Data.CvData as CvData
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import List.Extra
import Theme
import Util.Css as CssUtil
import Util.Layout as Layout
import Util.Motion as Motion


view : Html msg
view =
    let
        topics =
            CvData.cvData.elmTopics

        fontSizes =
            [ Css.rem 0.875, Css.rem 1, Css.rem 1.25, Css.rem 1.5 ]

        colors =
            [ CssUtil.toHex "#60B5CC"
            , CssUtil.toHex "#78CAD2"
            , CssUtil.toHex "#A4CE4E"
            , CssUtil.toHex "#F9D43A"
            , CssUtil.toHex "#E8831D"
            , CssUtil.toHex "#5D6777"
            ]

        styledWord idx word =
            let
                size =
                    List.Extra.getAt (modBy (List.length fontSizes) idx) fontSizes
                        |> Maybe.withDefault Theme.fontSize.lg

                color =
                    List.Extra.getAt (modBy (List.length colors) idx) colors
                        |> Maybe.withDefault Theme.color.text
            in
            Html.span
                [ Attributes.css
                    (Motion.revealStyle "translate3d(0, 10px, 0) scale(0.98)" 480 (toFloat (idx * 35))
                        ++ [ CssUtil.fontSize size
                           , CssUtil.color color
                           , CssUtil.marginRight 12
                           , CssUtil.marginBottom 12
                           , CssUtil.transition [ "color", "font-size" ]
                           ]
                    )
                ]
                [ Html.text word ]
    in
    Layout.flexColumn [ CssUtil.gapPx 24 ]
        [ List.indexedMap styledWord topics
            |> Layout.flexRow
                [ CssUtil.widthPct 100
                , CssUtil.property "animation" "none"
                , Layout.flexWrapWrap
                , Layout.justifyContentCenter
                , Layout.alignItemsCenter
                , CssUtil.gapPx 8
                , CssUtil.marginBottom 32
                ]
        ]
