module Atom.Heading exposing (HeadingLevel, h1, h2, h3)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Util.Css as CssUtil


type HeadingLevel
    = H1
    | H2
    | H3


baseStyle : List Css.Style
baseStyle =
    [ CssUtil.color Theme.color.text
    , CssUtil.fontWeight 700
    ]


styleForLevel : HeadingLevel -> List Css.Style
styleForLevel level =
    case level of
        H1 ->
            [ CssUtil.fontSize Theme.fontSize.xxl
            ]

        H2 ->
            [ CssUtil.fontSize Theme.fontSize.xl
            ]

        H3 ->
            [ CssUtil.fontSize Theme.fontSize.lg
            ]


view : HeadingLevel -> String -> Html msg
view level text =
    (case level of
        H1 ->
            Html.h1

        H2 ->
            Html.h2

        H3 ->
            Html.h3
    )
        [ Attributes.css (baseStyle ++ styleForLevel level) ]
        [ Html.text text ]


h1 : String -> Html msg
h1 =
    view H1


h2 : String -> Html msg
h2 =
    view H2


h3 : String -> Html msg
h3 =
    view H3
