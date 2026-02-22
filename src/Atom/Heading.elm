module Atom.Heading exposing (h2, h3)

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
    [ Css.fontFamily Css.sansSerif
    , CssUtil.color Theme.color.text
    , CssUtil.fontWeight 700
    , Css.marginBottom (Css.px 12)
    ]


styleForLevel : HeadingLevel -> List Css.Style
styleForLevel level =
    case level of
        H1 ->
            [ CssUtil.fontSize 36
            , Css.marginBottom (Css.px 20)
            ]

        H2 ->
            [ CssUtil.fontSize 28
            , Css.marginBottom (Css.px 16)
            ]

        H3 ->
            [ CssUtil.fontSize 20
            , Css.marginBottom (Css.px 12)
            ]


viewAtLevel : HeadingLevel -> String -> Html msg
viewAtLevel level text =
    Html.div
        [ Attributes.css (baseStyle ++ styleForLevel level) ]
        [ Html.text text ]


h2 : String -> Html msg
h2 =
    viewAtLevel H2


h3 : String -> Html msg
h3 =
    viewAtLevel H3
