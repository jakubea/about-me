module Atom.Text exposing (view)

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
    [ Css.fontFamily Css.sansSerif
    , CssUtil.color Theme.color.text
    , Css.lineHeight (Css.num 1.6)
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
