module Util.Layout exposing
    ( alignItemsCenter
    , alignItemsFlexEnd
    , alignSelfCenter
    , displayBlock
    , displayFlex
    , displayGrid
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


alignItemsCenter : Css.Style
alignItemsCenter =
    Css.alignItems Css.center


alignItemsFlexEnd : Css.Style
alignItemsFlexEnd =
    Css.alignItems Css.flexEnd


alignSelfCenter : Css.Style
alignSelfCenter =
    Css.alignSelf Css.center


display : Css.Display compatible -> Css.Style
display =
    Css.display


displayBlock : Css.Style
displayBlock =
    display Css.block


displayFlex : Css.Style
displayFlex =
    Css.displayFlex


displayGrid : Css.Style
displayGrid =
    Css.property "display" "grid"


displayInlineBlock : Css.Style
displayInlineBlock =
    display Css.inlineBlock


flexColumn : List Css.Style -> List (Html msg) -> Html msg
flexColumn styles =
    Html.div [ Attributes.css (displayFlex :: Css.flexDirection Css.column :: styles) ]


flexDirectionColumn : Css.Style
flexDirectionColumn =
    Css.flexDirection Css.column


flexInt : Int -> Css.Style
flexInt =
    Css.int >> Css.flex


flexRow : List Css.Style -> List (Html msg) -> Html msg
flexRow styles =
    Html.div [ Attributes.css (displayFlex :: Css.flexDirection Css.row :: styles) ]


flexWrapWrap : Css.Style
flexWrapWrap =
    Css.flexWrap Css.wrap


justifyContentCenter : Css.Style
justifyContentCenter =
    Css.justifyContent Css.center


justifyContentSpaceBetween : Css.Style
justifyContentSpaceBetween =
    Css.justifyContent Css.spaceBetween


positionAbsolute : Css.Style
positionAbsolute =
    Css.position Css.absolute


positionRelative : Css.Style
positionRelative =
    Css.position Css.relative


spacing : List Css.Style -> Html msg -> Html msg
spacing styles child =
    Html.div [ Attributes.css styles ] [ child ]
