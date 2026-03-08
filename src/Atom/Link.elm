module Atom.Link exposing (view, viewExternal)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Util.Css as CssUtil


baseStyle : List Css.Style
baseStyle =
    [ CssUtil.textDecorationNone
    , CssUtil.color Theme.color.textLight
    , CssUtil.fontWeight 500
    , CssUtil.hover
        [ CssUtil.color Theme.color.accent
        , CssUtil.textDecorationUnderline
        ]
    ]


view : String -> String -> Html msg
view label href =
    Html.a
        [ Attributes.href href
        , Attributes.css baseStyle
        ]
        [ Html.text label ]


viewExternal : String -> String -> Html msg
viewExternal label url =
    Html.a
        [ Attributes.href url
        , Attributes.target "_blank"
        , Attributes.rel "noopener noreferrer"
        , Attributes.css baseStyle
        ]
        [ Html.text label ]
