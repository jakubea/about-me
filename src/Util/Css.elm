module Util.Css exposing (backgroundColor, border, borderBottom, borderRadius, borderTop, color, container, cursorPointer, flex, flex1, flexColumn, flexRow, fontSize, fontWeight, gap, itemsCenter, justifyCenter, margin, marginBottom, marginLeft, marginLeftAuto, marginTop, outline3, padding, padding2, roundedFull, roundedLg, shadowMd, textCenter, toHex, transition, width, widthPct, zIndex)

import Css


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


borderRadius : Float -> Css.Style
borderRadius =
    toPx >> Css.borderRadius


color : Css.Color -> Css.Style
color =
    Css.color


cursorPointer : Css.Style
cursorPointer =
    Css.cursor Css.pointer


fontSize : Float -> Css.Style
fontSize =
    toPx >> Css.fontSize


fontWeight : Int -> Css.Style
fontWeight =
    Css.int >> Css.fontWeight


gap : Float -> Css.Style
gap gapValue =
    Css.property "gap" (String.fromFloat gapValue ++ "px")


marginBottom : Float -> Css.Style
marginBottom =
    toPx >> Css.marginBottom


marginLeft : Float -> Css.Style
marginLeft =
    toPx >> Css.marginLeft


marginLeftAuto : Css.Style
marginLeftAuto =
    Css.marginLeft Css.auto


marginTop : Float -> Css.Style
marginTop =
    toPx >> Css.marginTop


outline3 : Float -> Css.Color -> Css.Style
outline3 width_ =
    Css.outline3 (Css.px width_) Css.solid


padding : Float -> Css.Style
padding value =
    padding4 value value value value


padding2 : Float -> Float -> Css.Style
padding2 topBottom rightLeft =
    padding4 topBottom rightLeft topBottom rightLeft


padding4 : Float -> Float -> Float -> Float -> Css.Style
padding4 paddingTop paddingRight paddingBottom paddingLeft =
    Css.padding4 (toPx paddingTop) (toPx paddingRight) (toPx paddingBottom) (toPx paddingLeft)


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
        , Css.property "flex-direction" "column"
        ]


flexRow : Css.Style
flexRow =
    Css.batch
        [ Css.displayFlex
        , Css.property "flex-direction" "row"
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


justifyCenter : Css.Style
justifyCenter =
    Css.property "justify-content" "center"


roundedLg : Css.Style
roundedLg =
    Css.borderRadius (Css.px 8)


roundedFull : Css.Style
roundedFull =
    Css.borderRadius (Css.px 9999)


shadowMd : Css.Style
shadowMd =
    Css.boxShadow4 (Css.px 0) (Css.px 4) (Css.px 6) (Css.rgba 0 0 0 0.1)
