module Molecule.Card exposing (view, viewWithBorder)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Util.Css as CssUtil


baseStyle : List Css.Style
baseStyle =
    [ CssUtil.backgroundColor Theme.color.gray
    , CssUtil.padding 16
    , CssUtil.borderRadius 8
    , Css.boxShadow4 (Css.px 0) (Css.px 1) (Css.px 3) (Css.rgba 0 0 0 0.1)
    ]


withBorderStyle : List Css.Style
withBorderStyle =
    baseStyle
        ++ [ CssUtil.border Theme.color.white 1
           ]


view : List (Html msg) -> Html msg
view children =
    Html.div
        [ Attributes.css baseStyle ]
        children


viewWithBorder : List (Html msg) -> Html msg
viewWithBorder children =
    Html.div
        [ Attributes.css withBorderStyle ]
        children
