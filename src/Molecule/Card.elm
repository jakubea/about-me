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


viewWithBorder : List (Html msg) -> Html msg
viewWithBorder =
    Layout.flexColumn withBorderStyle
