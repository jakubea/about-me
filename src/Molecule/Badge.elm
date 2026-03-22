module Molecule.Badge exposing (ColorVariant(..), view)

import Atom.Text as Text
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
            , CssUtil.fontWeight 500
            , CssUtil.border textColor 1
            ]
        ]
        [ Text.view [ Text.small ] label ]
