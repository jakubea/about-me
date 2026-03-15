module Atom.Text2 exposing
    ( black
    , bold
    , gray
    , hoverColor
    , large
    , paragraph
    , red
    , regular
    , small
    , view
    , white
    )

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Util.Css as CssUtil


type alias Config =
    { size : Size
    , weight : Weight
    , color : Maybe Css.Color
    , hover : Maybe Css.Color
    }


type Size
    = Small
    | Regular
    | Large


type Weight
    = Normal
    | Bold


defaultConfig : Config
defaultConfig =
    { size = Regular
    , weight = Normal
    , color = Nothing
    , hover = Nothing
    }


view : List (Config -> Config) -> String -> Html msg
view modifiers content =
    element Html.span modifiers content


paragraph : List (Config -> Config) -> String -> Html msg
paragraph modifiers content =
    element Html.p modifiers content


element : (List (Html.Attribute msg) -> List (Html msg) -> Html msg) -> List (Config -> Config) -> String -> Html msg
element tag modifiers content =
    let
        config =
            List.foldl (\fn config_ -> fn config_) defaultConfig modifiers
    in
    tag
        [ Attributes.css (styles config) ]
        [ Html.text content ]


small : Config -> Config
small c =
    { c | size = Small }


regular : Config -> Config
regular config =
    { config | size = Regular }


large : Config -> Config
large config =
    { config | size = Large }


bold : Config -> Config
bold config =
    { config | weight = Bold }


black : Config -> Config
black config =
    { config | color = Just Theme.color.primary }


gray : Config -> Config
gray config =
    { config | color = Just Theme.color.gray }


red : Config -> Config
red config =
    { config | color = Just Theme.color.accent }


white : Config -> Config
white config =
    { config | color = Just Theme.color.white }


hoverColor : (Config -> Config) -> Config -> Config
hoverColor modifier config =
    let
        config_ =
            modifier defaultConfig
    in
    { config | hover = config_.color }


styles : Config -> List Css.Style
styles config =
    baseStyle
        ++ sizeStyle config.size
        ++ weightStyle config.weight
        ++ maybeColor config.color
        ++ hoverStyle config.hover


maybeColor : Maybe Css.Color -> List Css.Style
maybeColor color =
    [ case color of
        Nothing ->
            Css.color Css.inherit

        Just color_ ->
            Css.color color_
    ]


baseStyle : List Css.Style
baseStyle =
    [ CssUtil.lineHeight 1.6 ]


sizeStyle : Size -> List Css.Style
sizeStyle size =
    case size of
        Small ->
            [ CssUtil.fontSize Theme.fontSize.xs ]

        Regular ->
            [ CssUtil.fontSize Theme.fontSize.md ]

        Large ->
            [ CssUtil.fontSize Theme.fontSize.lg ]


weightStyle : Weight -> List Css.Style
weightStyle weight =
    case weight of
        Normal ->
            []

        Bold ->
            [ CssUtil.fontWeight 600 ]


hoverStyle : Maybe Css.Color -> List Css.Style
hoverStyle maybeColor_ =
    case maybeColor_ of
        Nothing ->
            [ Css.hover [ Css.color Css.inherit ] ]

        Just color ->
            [ Css.hover [ Css.color color ] ]
