module Atom.Text exposing (TextSize, view)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Util.Css as CssUtil


type TextSize
    = Small
    | Regular
    | Large


baseStyle : List Css.Style
baseStyle =
    [ CssUtil.color Theme.color.text
    , CssUtil.lineHeight 1.6
    ]


styleForSize : TextSize -> List Css.Style
styleForSize size =
    case size of
        Small ->
            [ CssUtil.fontSize 12
            ]

        Regular ->
            [ CssUtil.fontSize 14
            ]

        Large ->
            [ CssUtil.fontSize 16
            , CssUtil.fontWeight 600
            ]


view : String -> Html msg
view content =
    Html.p
        [ Attributes.css (baseStyle ++ styleForSize Regular) ]
        [ Html.text content ]
