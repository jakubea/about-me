module Molecule.Card exposing (viewWithBorder)

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
    , CssUtil.shadowMd
    ]


withBorderStyle : List Css.Style
withBorderStyle =
    baseStyle ++ [ CssUtil.border Theme.color.white 1 ]


viewWithBorder : List (Html msg) -> Html msg
viewWithBorder =
    Html.div [ Attributes.css withBorderStyle ]
