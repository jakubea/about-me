module Util.Layout exposing
    ( alignItemsCenter
    , alignSelfCenter
    , displayBlock
    , displayFlex
    , displayInlineBlock
    , flexColumn
    , flexDirectionColumn
    , flexInt
    , flexRow
    , flexWrapWrap
    , justifyContentCenter
    , justifyContentSpaceBetween
    , positionAbsolute
    , positionRelative
    , spacing
    )

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes


flexRow : List Css.Style -> List (Html msg) -> Html msg
flexRow styles children =
    Html.div
        [ Attributes.css (displayFlex :: Css.flexDirection Css.row :: styles) ]
        children


flexColumn : List Css.Style -> List (Html msg) -> Html msg
flexColumn styles children =
    Html.div
        [ Attributes.css (displayFlex :: Css.flexDirection Css.column :: styles) ]
        children


spacing : List Css.Style -> Html msg -> Html msg
spacing styles child =
    Html.div [ Attributes.css styles ] [ child ]


alignItemsCenter : Css.Style
alignItemsCenter =
    Css.alignItems Css.center


alignSelfCenter : Css.Style
alignSelfCenter =
    Css.alignSelf Css.center


justifyContentCenter : Css.Style
justifyContentCenter =
    Css.justifyContent Css.center


justifyContentSpaceBetween : Css.Style
justifyContentSpaceBetween =
    Css.justifyContent Css.spaceBetween


display : Css.Display compatible -> Css.Style
display =
    Css.display


flexWrapWrap : Css.Style
flexWrapWrap =
    Css.flexWrap Css.wrap


flexDirectionColumn : Css.Style
flexDirectionColumn =
    Css.flexDirection Css.column



-- COMMON CSS ALIASES


displayFlex : Css.Style
displayFlex =
    Css.displayFlex


displayBlock : Css.Style
displayBlock =
    display Css.block


displayInlineBlock : Css.Style
displayInlineBlock =
    display Css.inlineBlock


positionAbsolute : Css.Style
positionAbsolute =
    Css.position Css.absolute


positionRelative : Css.Style
positionRelative =
    Css.position Css.relative


flexInt : Int -> Css.Style
flexInt =
    Css.int >> Css.flex
