module Util.Css exposing
    ( backgroundColor
    , border
    , borderBottom
    , borderRadius
    , borderRadiusPct
    , borderTop
    , boxSizingBorderBox
    , color
    , colorInherit
    , cursorPointer
    , focus
    , fontFamilies
    , fontSize
    , fontWeight
    , gapPx
    , heightAuto
    , heightPct
    , heightPx
    , hover
    , lastChild
    , leftPx
    , lineHeight
    , marginBottom
    , marginRight
    , marginTop
    , marginZero
    , maxWidth
    , maxWidthPct
    , minHeightVh
    , outline3
    , outlineOffsetPx
    , overflowHidden
    , padding
    , padding2
    , paddingBottom
    , paddingTop
    , paddingZero
    , positionSticky
    , property
    , rightPx
    , roundedLg
    , shadowMd
    , textAlignCenter
    , textAlignLeft
    , textCenter
    , textDecorationNone
    , textDecorationUnderline
    , toHex
    , topPx
    , transition
    , verticalAlignMiddle
    , widthPct
    , widthPx
    , zIndex
    )

import Css


backgroundColor : Css.Color -> Css.Style
backgroundColor =
    Css.backgroundColor


border : Css.Color -> Float -> Css.Style
border color_ borderWidth_ =
    Css.border3 (toPx borderWidth_) Css.solid color_


borderBottom : Css.Color -> Float -> Css.Style
borderBottom color_ borderWidth_ =
    Css.borderBottom3 (toPx borderWidth_) Css.solid color_


borderRadius : Float -> Css.Style
borderRadius =
    toPx >> Css.borderRadius


borderRadiusPct : Float -> Css.Style
borderRadiusPct =
    toPct >> Css.borderRadius


borderTop : Css.Color -> Float -> Css.Style
borderTop color_ borderWidth_ =
    Css.borderTop3 (toPx borderWidth_) Css.solid color_


boxSizingBorderBox : Css.Style
boxSizingBorderBox =
    Css.boxSizing Css.borderBox


color : Css.Color -> Css.Style
color =
    Css.color


colorInherit : Css.Style
colorInherit =
    Css.color Css.inherit


cursorPointer : Css.Style
cursorPointer =
    Css.cursor Css.pointer


focus : List Css.Style -> Css.Style
focus =
    Css.focus


fontFamilies : List String -> Css.Style
fontFamilies families =
    Css.fontFamilies families


fontSize : Css.Rem -> Css.Style
fontSize =
    Css.fontSize


fontWeight : Int -> Css.Style
fontWeight =
    Css.int >> Css.fontWeight


gap : Css.Length compatible units -> Css.Style
gap =
    .value >> property "gap"


gapPx : Float -> Css.Style
gapPx =
    toPx >> gap


heightAuto : Css.Style
heightAuto =
    Css.height Css.auto


heightPct : Float -> Css.Style
heightPct =
    toPct >> Css.height


heightPx : Float -> Css.Style
heightPx =
    toPx >> Css.height


hover : List Css.Style -> Css.Style
hover styles =
    Css.hover styles


lastChild : List Css.Style -> Css.Style
lastChild =
    Css.lastChild


leftPx : Float -> Css.Style
leftPx =
    toPx >> Css.left


lineHeight : Float -> Css.Style
lineHeight n =
    Css.lineHeight (Css.num n)


marginBottom : Float -> Css.Style
marginBottom =
    toPx >> Css.marginBottom


marginRight : Float -> Css.Style
marginRight =
    toPx >> Css.marginRight


marginTop : Float -> Css.Style
marginTop =
    toPx >> Css.marginTop


marginZero : Css.Style
marginZero =
    Css.margin Css.zero


maxWidth : Float -> Css.Style
maxWidth =
    toPx >> Css.maxWidth


maxWidthPct : Float -> Css.Style
maxWidthPct =
    toPct >> Css.maxWidth


minHeightVh : Float -> Css.Style
minHeightVh =
    Css.vh >> Css.minHeight


overflowHidden : Css.Style
overflowHidden =
    Css.overflow Css.hidden


outline3 : Float -> Css.Color -> Css.Style
outline3 outlineWidth outlineColor =
    Css.outline3 (toPx outlineWidth) Css.solid outlineColor


outlineOffsetPx : Float -> Css.Style
outlineOffsetPx =
    toPx >> Css.outlineOffset


padding : Float -> Css.Style
padding =
    toPx >> Css.padding


padding2 : Float -> Float -> Css.Style
padding2 v h =
    Css.padding2 (toPx v) (toPx h)


paddingBottom : Float -> Css.Style
paddingBottom =
    toPx >> Css.paddingBottom


paddingTop : Float -> Css.Style
paddingTop =
    toPx >> Css.paddingTop


paddingZero : Css.Style
paddingZero =
    Css.padding Css.zero


positionSticky : Css.Style
positionSticky =
    Css.position Css.sticky


property : String -> String -> Css.Style
property =
    Css.property


rightPx : Float -> Css.Style
rightPx =
    toPx >> Css.right


roundedLg : Css.Style
roundedLg =
    Css.borderRadius (toPx 8)


shadowMd : Css.Style
shadowMd =
    Css.boxShadow4 (toPx 0) (toPx 4) (toPx 6) (Css.rgba 0 0 0 0.1)


textAlignCenter : Css.Style
textAlignCenter =
    Css.textAlign Css.center


textAlignLeft : Css.Style
textAlignLeft =
    Css.textAlign Css.left


textCenter : Css.Style
textCenter =
    Css.textAlign Css.center


textDecorationNone : Css.Style
textDecorationNone =
    Css.textDecoration Css.none


textDecorationUnderline : Css.Style
textDecorationUnderline =
    Css.textDecoration Css.underline


topPx : Float -> Css.Style
topPx =
    toPx >> Css.top


transition : List String -> Css.Style
transition props =
    property "transition" (String.join ", " (List.map (\p -> p ++ " 0.2s ease-in-out") props))


verticalAlignMiddle : Css.Style
verticalAlignMiddle =
    Css.verticalAlign Css.middle


widthPct : Float -> Css.Style
widthPct =
    toPct >> Css.width


widthPx : Float -> Css.Style
widthPx =
    toPx >> Css.width


zIndex : Int -> Css.Style
zIndex =
    Css.int >> Css.zIndex



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
