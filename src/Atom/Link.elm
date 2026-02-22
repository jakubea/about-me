module Atom.Link exposing (view, viewExternal)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Util.Css as CssUtil


baseStyle : List Css.Style
baseStyle =
    [ Css.textDecoration Css.none
    , CssUtil.color Theme.color.primary
    , Css.fontWeight (Css.int 500)
    , Css.hover
        [ CssUtil.color Theme.color.accent
        , Css.textDecoration Css.underline
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
