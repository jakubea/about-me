module Atom.Button exposing (ColorVariant(..), new, view, withColorVariant)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Html.Styled.Events as Events
import Theme
import Util.Css as CssUtil


type ColorVariant
    = Primary
    | Secondary
    | Minimal


type alias Button msg =
    { label : String
    , onClick : msg
    , colorVariant : ColorVariant
    , isDisabled : Bool
    }


new : String -> msg -> Button msg
new label onClick =
    { label = label
    , onClick = onClick
    , colorVariant = Primary
    , isDisabled = False
    }


withColorVariant : ColorVariant -> Button msg -> Button msg
withColorVariant variant button =
    { button | colorVariant = variant }


baseStyle : List Css.Style
baseStyle =
    [ CssUtil.cursorPointer
    , Css.border3 (Css.px 0) Css.solid Css.transparent
    , Css.padding (Css.px 10)
    , Css.paddingLeft (Css.px 16)
    , Css.paddingRight (Css.px 16)
    , CssUtil.roundedLg
    , CssUtil.fontFamilyInherit
    , Css.fontSize (Css.px Theme.fontSize.md)
    , Css.fontWeight (Css.int 600)
    , CssUtil.transition [ "background-color", "color", "transform" ]
    , Css.active
        [ Css.transform (Css.scale 0.98)
        ]
    ]


styleForVariant : ColorVariant -> List Css.Style
styleForVariant variant =
    case variant of
        Primary ->
            [ CssUtil.backgroundColor Theme.color.primary
            , CssUtil.color Theme.color.white
            , Css.hover [ CssUtil.backgroundColor Theme.color.accent ]
            ]

        Secondary ->
            [ CssUtil.backgroundColor Theme.color.gray
            , CssUtil.color Theme.color.text
            , Css.hover [ CssUtil.backgroundColor (CssUtil.toHex "#e5e5e5") ]
            ]

        Minimal ->
            [ CssUtil.backgroundColor Theme.color.white
            , CssUtil.color Theme.color.primary
            , Css.border3 (Css.px 1) Css.solid Theme.color.primary
            , Css.hover [ CssUtil.backgroundColor Theme.color.gray ]
            ]


view : Button msg -> Html msg
view button =
    Html.button
        [ Events.onClick button.onClick
        , Attributes.disabled button.isDisabled
        , Attributes.css (baseStyle ++ styleForVariant button.colorVariant)
        ]
        [ Html.text button.label ]
