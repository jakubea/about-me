module Molecule.LanguageCircle exposing (view)

import Atom.Layout as Layout
import Atom.Text as Text
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Svg.Styled as Svg
import Svg.Styled.Attributes as SvgAttr
import Theme
import Util.Css as CssUtil


view : { percent : Float, label : String } -> Html msg
view { percent, label } =
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
        [ Layout.alignItemsCenter
        , CssUtil.padding2 0 80
        ]
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
                []
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
        , Html.p
            [ Attributes.css [ CssUtil.color Theme.color.textLight, CssUtil.marginTop 8, CssUtil.textCenter ] ]
            [ Text.view [] label ]
        ]
