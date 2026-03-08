module Util.Css exposing (..)

import Css


alignItemsCenter : Css.Style
alignItemsCenter =
    Css.alignItems Css.center


boxShadow : String -> Css.Style
boxShadow val =
    Css.property "box-shadow" val


listStyleTypeDisc : Css.Style
listStyleTypeDisc =
    Css.property "list-style-type" "disc"


lineHeight : Float -> Css.Style
lineHeight n =
    Css.lineHeight (Css.num n)


textDecorationNone : Css.Style
textDecorationNone =
    Css.textDecoration Css.none


textDecorationUnderline : Css.Style
textDecorationUnderline =
    Css.textDecoration Css.underline


hover : List Css.Style -> Css.Style
hover styles =
    Css.pseudoClass ":hover" styles


marginZero : Css.Style
marginZero =
    Css.margin Css.zero


paddingZero : Css.Style
paddingZero =
    Css.padding Css.zero


fontFamilies : List String -> Css.Style
fontFamilies families =
    Css.fontFamilies families


backgroundColor : Css.Color -> Css.Style
backgroundColor =
    Css.backgroundColor


border : Css.Color -> Float -> Css.Style
border color_ borderWidth_ =
    Css.border3 (toPx borderWidth_) Css.solid color_


borderTop : Css.Color -> Float -> Css.Style
borderTop color_ borderWidth_ =
    Css.borderTop3 (toPx borderWidth_) Css.solid color_


borderBottom : Css.Color -> Float -> Css.Style
borderBottom color_ borderWidth_ =
    Css.borderBottom3 (toPx borderWidth_) Css.solid color_


displayInlineBlock : Css.Style
displayInlineBlock =
    Css.display Css.inlineBlock


displayFlex : Css.Style
displayFlex =
    Css.displayFlex


flexWrapWrap : Css.Style
flexWrapWrap =
    Css.flexWrap Css.wrap


gap : Css.Length compatible units -> Css.Style
gap =
    .value >> Css.property "gap"


gapPx : Float -> Css.Style
gapPx =
    toPx >> gap


maxWidth : Float -> Css.Style
maxWidth =
    toPx >> Css.maxWidth


minHeight : Float -> Css.Style
minHeight =
    toPx >> Css.minHeight


minWidth : Float -> Css.Style
minWidth =
    toPx >> Css.minWidth


marginRight : Float -> Css.Style
marginRight =
    toPx >> Css.marginRight


textAlignCenter : Css.Style
textAlignCenter =
    Css.textAlign Css.center


paddingLeft : Float -> Css.Style
paddingLeft =
    toPx >> Css.paddingLeft


paddingRight : Float -> Css.Style
paddingRight =
    toPx >> Css.paddingRight


paddingTop : Float -> Css.Style
paddingTop =
    toPx >> Css.paddingTop


paddingBottom : Float -> Css.Style
paddingBottom =
    toPx >> Css.paddingBottom


property : String -> String -> Css.Style
property =
    Css.property


color : Css.Color -> Css.Style
color =
    Css.color


fontSize : Float -> Css.Style
fontSize =
    toPx >> Css.fontSize


fontWeight : Int -> Css.Style
fontWeight =
    Css.fontWeight << Css.int


marginBottom : Float -> Css.Style
marginBottom =
    toPx >> Css.marginBottom


marginLeft : Float -> Css.Style
marginLeft =
    toPx >> Css.marginLeft


marginTop : Float -> Css.Style
marginTop =
    toPx >> Css.marginTop


outline3 : Float -> Css.Color -> Css.Style
outline3 outlineWidth outlineColor =
    Css.outline3 (toPx outlineWidth) Css.solid outlineColor


padding : Float -> Css.Style
padding =
    toPx >> Css.padding


padding2 : Float -> Float -> Css.Style
padding2 v h =
    Css.padding2 (toPx v) (toPx h)


cursorPointer : Css.Style
cursorPointer =
    Css.cursor Css.pointer


borderRadius : Float -> Css.Style
borderRadius =
    toPx >> Css.borderRadius


textCenter : Css.Style
textCenter =
    Css.textAlign Css.center


zIndex : Int -> Css.Style
zIndex =
    Css.int >> Css.zIndex



-- SIZE


width : Float -> Css.Style
width =
    toPx >> Css.width


widthPct : Float -> Css.Style
widthPct =
    toPct >> Css.width



-- HELPERS


toHex : String -> Css.Color
toHex =
    Css.hex


toPct : Float -> Css.Pct
toPct =
    Css.pct


toPx : Float -> Css.Px
toPx =
    Css.px


margin : Float -> Css.Style
margin value =
    Css.margin (toPx value)


flexColumn : Css.Style
flexColumn =
    Css.batch
        [ Css.displayFlex
        , Css.flexDirection Css.column
        ]


flexRow : Css.Style
flexRow =
    Css.batch
        [ Css.displayFlex
        , Css.flexDirection Css.row
        ]


flex : Css.Style
flex =
    Css.displayFlex


flex1 : Css.Style
flex1 =
    Css.flex <| Css.int 1


container : Css.Style
container =
    Css.batch
        [ Css.maxWidth (Css.px 1200)
        , Css.marginLeft Css.auto
        , Css.marginRight Css.auto
        , Css.paddingLeft (Css.px 16)
        , Css.paddingRight (Css.px 16)
        ]


transition : List String -> Css.Style
transition props =
    Css.property "transition" (String.join ", " (List.map (\p -> p ++ " 0.2s ease-in-out") props))


itemsCenter : Css.Style
itemsCenter =
    Css.property "align-items" "center"


justifyContentCenter : Css.Style
justifyContentCenter =
    Css.justifyContent Css.center


justifyContentSpaceBetween : Css.Style
justifyContentSpaceBetween =
    Css.justifyContent Css.spaceBetween


roundedLg : Css.Style
roundedLg =
    Css.borderRadius (Css.px 8)


shadowMd : Css.Style
shadowMd =
    Css.boxShadow4 (Css.px 0) (Css.px 4) (Css.px 6) (Css.rgba 0 0 0 0.1)
