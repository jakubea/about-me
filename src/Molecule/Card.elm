module Molecule.Card exposing (viewWithBorder)

import Css
import Html.Styled exposing (Html)
import Theme
import Util.Css as CssUtil
import Util.Layout as Layout


baseStyle : List Css.Style
baseStyle =
    [ CssUtil.backgroundColor Theme.color.gray
    , CssUtil.padding 16
    , CssUtil.borderRadius 8
    , CssUtil.shadowMd
    ]


withBorderStyle : List Css.Style
withBorderStyle =
    baseStyle ++ [ CssUtil.border Theme.color.white 1 ]


hoverLiftStyle : List Css.Style
hoverLiftStyle =
    [ CssUtil.transition [ "transform", "box-shadow", "border-color" ]
    , CssUtil.willChangeTransform
    , CssUtil.hover
        [ CssUtil.property "transform" "translate3d(0, -3px, 0)"
        , CssUtil.boxShadowValue "0 9px 18px rgba(0, 0, 0, 0.16)"
        ]
    ]


viewWithBorder : List (Html msg) -> Html msg
viewWithBorder =
    Layout.flexColumn (hoverLiftStyle ++ Layout.displayFlex :: Layout.flexDirectionColumn :: withBorderStyle)
