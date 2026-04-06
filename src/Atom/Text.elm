module Atom.Text exposing
    ( bold
    , center
    , grayLight
    , hoverColor
    , large
    , none
    , red
    , regular
    , small
    , view
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
    , textAlign : TextAlign
    , hover : Maybe Css.Color
    }


type Size
    = Small
    | Regular
    | Large


type Weight
    = Normal
    | Bold


type TextAlign
    = Left
    | Center


defaultConfig : Config
defaultConfig =
    { size = Regular
    , weight = Normal
    , color = Nothing
    , hover = Nothing
    , textAlign = Left
    }


view : List (Config -> Config) -> String -> Html msg
view modifiers content =
    element Html.span modifiers content


none : Html msg
none =
    Html.text ""


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
small config =
    { config | size = Small }


regular : Config -> Config
regular config =
    { config | size = Regular }


large : Config -> Config
large config =
    { config | size = Large }


bold : Config -> Config
bold config =
    { config | weight = Bold }


grayLight : Config -> Config
grayLight config =
    { config | color = Just Theme.color.textLight }


red : Config -> Config
red config =
    { config | color = Just Theme.color.accent }


hoverColor : (Config -> Config) -> Config -> Config
hoverColor modifier config =
    let
        config_ =
            modifier defaultConfig
    in
    { config | hover = config_.color }


center : Config -> Config
center config =
    { config | textAlign = Center }


styles : Config -> List Css.Style
styles config =
    sizeStyle config.size
        ++ weightStyle config.weight
        ++ maybeColor config.color
        ++ hoverStyle config.hover
        ++ textAlign config.textAlign


maybeColor : Maybe Css.Color -> List Css.Style
maybeColor color =
    [ case color of
        Nothing ->
            CssUtil.colorInherit

        Just color_ ->
            CssUtil.color color_
    ]


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
            []

        Just color ->
            [ CssUtil.hover [ CssUtil.color color ] ]


textAlign : TextAlign -> List Css.Style
textAlign textAlign_ =
    case textAlign_ of
        Center ->
            [ CssUtil.textAlignCenter ]

        Left ->
            [ CssUtil.textAlignLeft ]
