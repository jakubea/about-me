module Atom.Heading exposing (h1, h2, h3)

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
    , Css.fontWeight (Css.int 700)
    , Css.marginBottom (Css.px 12)
    ]


styleForLevel : HeadingLevel -> List Css.Style
styleForLevel level =
    case level of
        H1 ->
            [ Css.fontSize (Css.px 36)
            , Css.marginBottom (Css.px 20)
            ]

        H2 ->
            [ Css.fontSize (Css.px 28)
            , Css.marginBottom (Css.px 16)
            ]

        H3 ->
            [ Css.fontSize (Css.px 20)
            , Css.marginBottom (Css.px 12)
            ]


viewAtLevel : HeadingLevel -> String -> Html msg
viewAtLevel level text =
    Html.div
        [ Attributes.css (baseStyle ++ styleForLevel level) ]
        [ Html.text text ]


h1 : String -> Html msg
h1 =
    viewAtLevel H1


h2 : String -> Html msg
h2 =
    viewAtLevel H2


h3 : String -> Html msg
h3 =
    viewAtLevel H3
