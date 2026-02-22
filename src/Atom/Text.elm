module Atom.Text exposing (view, viewLarge, viewSmall)

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
            [ Css.fontSize (Css.px 12)
            ]

        Regular ->
            [ Css.fontSize (Css.px 14)
            ]

        Large ->
            [ Css.fontSize (Css.px 16)
            , Css.fontWeight (Css.int 600)
            ]


view : String -> Html msg
view content =
    Html.p
        [ Attributes.css (baseStyle ++ styleForSize Regular) ]
        [ Html.text content ]


viewSmall : String -> Html msg
viewSmall content =
    Html.span
        [ Attributes.css (baseStyle ++ styleForSize Small) ]
        [ Html.text content ]


viewLarge : String -> Html msg
viewLarge content =
    Html.p
        [ Attributes.css (baseStyle ++ styleForSize Large) ]
        [ Html.text content ]
