module Molecule.Badge exposing (view)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Util.Css as CssUtil


view : String -> Html msg
view label =
    Html.span
        [ Attributes.css
            [ CssUtil.backgroundColor Theme.color.primary
            , CssUtil.color Theme.color.white
            , CssUtil.padding 4
            , CssUtil.padding2 4 8
            , CssUtil.borderRadius 4
            , Css.fontSize (Css.px 12)
            , Css.fontWeight (Css.int 500)
            , Css.display Css.inlineBlock
            ]
        ]
        [ Html.text label ]
