module Molecule.LanguageCircle exposing (view)

import Atom.Text as Text
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Svg.Styled as Svg
import Svg.Styled.Attributes as SvgAttr
import Theme
import Util.Css as CssUtil
import Util.Layout as Layout
import Util.Motion as Motion


view : { percent : Float, label : String, delayMs : Float } -> Html msg
view { percent, label, delayMs } =
    let
        size =
            96

        strokeWidth =
            10

        radius =
            (size - strokeWidth) / 2

        circumference =
            2 * pi * radius

        progress =
            circumference * (1 - percent / 100)
    in
    Layout.flexColumn
        (Motion.revealStyle "translate3d(0, 14px, 0) scale(0.96)" 520 delayMs
            ++ [ Layout.alignItemsCenter
               , CssUtil.padding2 0 80
               , CssUtil.transition [ "transform", "filter" ]
               , CssUtil.willChangeTransform
               , CssUtil.hover
                    [ CssUtil.property "transform" "translate3d(0, -4px, 0) scale(1.04)"
                    , CssUtil.property "filter" "drop-shadow(0 10px 18px rgba(0, 0, 0, 0.18))"
                    ]
               ]
        )
        [ Layout.flexColumn
            (Motion.revealStyleWithEasing "ease-out" "translate3d(0, 6px, 0)" 420 (delayMs + 180))
            [ Svg.svg
                [ SvgAttr.width (String.fromFloat size)
                , SvgAttr.height (String.fromFloat size)
                , SvgAttr.viewBox ("0 0 " ++ String.fromFloat size ++ " " ++ String.fromFloat size)
                ]
                [ Svg.circle
                    [ SvgAttr.cx (String.fromFloat (size / 2))
                    , SvgAttr.cy (String.fromFloat (size / 2))
                    , SvgAttr.r (String.fromFloat radius)
                    , SvgAttr.stroke "#ff2d2d"
                    , SvgAttr.strokeWidth (String.fromFloat strokeWidth)
                    , SvgAttr.fill "none"
                    , SvgAttr.opacity "0.15"
                    ]
                    []
                , Svg.circle
                    [ SvgAttr.cx (String.fromFloat (size / 2))
                    , SvgAttr.cy (String.fromFloat (size / 2))
                    , SvgAttr.r (String.fromFloat radius)
                    , SvgAttr.stroke "#ff2d2d"
                    , SvgAttr.strokeWidth (String.fromFloat strokeWidth)
                    , SvgAttr.fill "none"
                    , SvgAttr.strokeDasharray (String.fromFloat circumference)
                    , SvgAttr.strokeDashoffset (String.fromFloat progress)
                    , SvgAttr.strokeLinecap "round"
                    , SvgAttr.transform ("rotate(-90 " ++ String.fromFloat (size / 2) ++ " " ++ String.fromFloat (size / 2) ++ ")")
                    ]
                    [ Svg.node "animate"
                        [ SvgAttr.attributeName "stroke-dashoffset"
                        , SvgAttr.attributeType "XML"
                        , SvgAttr.from (String.fromFloat circumference)
                        , SvgAttr.to (String.fromFloat progress)
                        , SvgAttr.dur "0.9s"
                        , SvgAttr.begin (String.fromFloat ((delayMs + 120) / 1000) ++ "s")
                        , SvgAttr.fill "freeze"
                        ]
                        []
                    , Svg.node "animate"
                        [ SvgAttr.attributeName "opacity"
                        , SvgAttr.attributeType "XML"
                        , SvgAttr.from "0.35"
                        , SvgAttr.to "1"
                        , SvgAttr.dur "0.9s"
                        , SvgAttr.begin (String.fromFloat ((delayMs + 120) / 1000) ++ "s")
                        , SvgAttr.fill "freeze"
                        ]
                        []
                    ]
                , Svg.text_
                    [ SvgAttr.x (String.fromFloat (size / 2))
                    , SvgAttr.y (String.fromFloat ((size / 2) + 6))
                    , SvgAttr.textAnchor "middle"
                    , SvgAttr.fontSize "22"
                    , SvgAttr.fill "#ff2d2d"
                    , SvgAttr.fontWeight "bold"
                    ]
                    [ Svg.text (String.fromInt (round percent) ++ "%") ]
                ]
            ]
        , Html.p
            [ Attributes.css [ CssUtil.color Theme.color.textLight, CssUtil.marginTop 8, CssUtil.textCenter ] ]
            [ Text.view [] label ]
        ]
