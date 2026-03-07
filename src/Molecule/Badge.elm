module Molecule.Badge exposing (ColorVariant(..), view)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Util.Css as CssUtil


type ColorVariant
    = Black
    | White


view : ColorVariant -> String -> Html msg
view colorVariant label =
    let
        ( textColor, backgroundColor ) =
            case colorVariant of
                Black ->
                    ( Theme.color.textLight, Theme.color.primary )

                White ->
                    ( Theme.color.primary, Theme.color.textLight )
    in
    Html.span
        [ Attributes.css
            [ CssUtil.backgroundColor backgroundColor
            , CssUtil.color textColor
            , CssUtil.padding 4
            , CssUtil.padding2 4 8
            , CssUtil.borderRadius 4
            , CssUtil.fontSize 14
            , CssUtil.fontWeight 500
            , Css.display Css.inlineBlock
            , CssUtil.border textColor 1
            ]
        ]
        [ Html.text label ]
