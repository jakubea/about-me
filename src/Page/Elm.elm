module Page.Elm exposing (view)

import Data.CvData as CvData
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import List.Extra
import Theme
import Util.Css as CssUtil


view : Html msg
view =
    let
        topics =
            CvData.cvData.elmTopics

        fontSizes =
            [ 12, 14, 16, 18, 20, 22, 24 ]

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
                    case List.Extra.getAt (modBy (List.length fontSizes) idx) fontSizes of
                        Just s ->
                            s

                        Nothing ->
                            18

                color =
                    case List.Extra.getAt (modBy (List.length colors) idx) colors of
                        Just c ->
                            c

                        Nothing ->
                            Theme.color.text

                weight =
                    400 + modBy 3 idx * 100
            in
            Html.span
                [ Attributes.css
                    [ CssUtil.fontSize (toFloat size)
                    , CssUtil.color color
                    , CssUtil.displayInlineBlock
                    , CssUtil.marginRight 12
                    , CssUtil.marginBottom 12
                    , CssUtil.fontWeight weight
                    , CssUtil.transition [ "color", "font-size" ]
                    , CssUtil.cursorPointer
                    ]
                ]
                [ Html.text word ]
    in
    Html.div
        [ Attributes.css
            [ CssUtil.displayFlex
            , CssUtil.flexColumn
            , CssUtil.alignItemsCenter
            , CssUtil.paddingTop 32
            , CssUtil.paddingBottom 32
            , CssUtil.backgroundColor Theme.color.surface
            , CssUtil.borderRadius 16
            , CssUtil.boxShadow "0 4px 24px rgba(0,0,0,0.08)"
            ]
        ]
        [ Html.div
            [ Attributes.css
                [ CssUtil.widthPct 100
                , CssUtil.displayFlex
                , CssUtil.flexWrapWrap
                , CssUtil.justifyContentCenter
                , CssUtil.alignItemsCenter
                , CssUtil.gapPx 8
                , CssUtil.marginBottom 32
                ]
            ]
            (List.indexedMap styledWord topics)
        ]
