module Util.Css exposing
    ( backgroundColor
    , border
    , borderBottom
    , borderRadius
    , borderRadiusPct
    , borderTop
    , boxSizingBorderBox
    , color
    , cursorPointer
    , fontFamilies
    , fontSize
    , fontWeight
    , gapPx
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
    , overflowHidden
    , padding
    , padding2
    , paddingBottom
    , paddingTop
    , paddingZero
    , positionSticky
    , property
    , roundedLg
    , shadowMd
    , textAlignCenter
    , textCenter
    , textDecorationNone
    , toHex
    , topPx
    , transition
    , verticalAlignMiddle
    , widthPct
    , widthPx
    , zIndex
    )

import Css


boxSizingBorderBox : Css.Style
boxSizingBorderBox =
    Css.boxSizing Css.borderBox


lineHeight : Float -> Css.Style
lineHeight n =
    Css.lineHeight (Css.num n)


textDecorationNone : Css.Style
textDecorationNone =
    Css.textDecoration Css.none


hover : List Css.Style -> Css.Style
hover styles =
    Css.hover styles


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


gap : Css.Length compatible units -> Css.Style
gap =
    .value >> Css.property "gap"


gapPx : Float -> Css.Style
gapPx =
    toPx >> gap


heightPx : Float -> Css.Style
heightPx =
    toPx >> Css.height


widthPx : Float -> Css.Style
widthPx =
    toPx >> Css.width


maxWidth : Float -> Css.Style
maxWidth =
    toPx >> Css.maxWidth


maxWidthPct : Float -> Css.Style
maxWidthPct =
    toPct >> Css.maxWidth


minHeightVh : Float -> Css.Style
minHeightVh =
    Css.vh >> Css.minHeight


marginRight : Float -> Css.Style
marginRight =
    toPx >> Css.marginRight


textAlignCenter : Css.Style
textAlignCenter =
    Css.textAlign Css.center


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


fontSize : Css.Rem -> Css.Style
fontSize =
    Css.fontSize


fontWeight : Int -> Css.Style
fontWeight =
    Css.fontWeight << Css.int


marginBottom : Float -> Css.Style
marginBottom =
    toPx >> Css.marginBottom


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


borderRadiusPct : Float -> Css.Style
borderRadiusPct =
    toPct >> Css.borderRadius


textCenter : Css.Style
textCenter =
    Css.textAlign Css.center


zIndex : Int -> Css.Style
zIndex =
    Css.int >> Css.zIndex


widthPct : Float -> Css.Style
widthPct =
    toPct >> Css.width


heightPct : Float -> Css.Style
heightPct =
    toPct >> Css.height



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


transition : List String -> Css.Style
transition props =
    Css.property "transition" (String.join ", " (List.map (\p -> p ++ " 0.2s ease-in-out") props))


roundedLg : Css.Style
roundedLg =
    Css.borderRadius (Css.px 8)


shadowMd : Css.Style
shadowMd =
    Css.boxShadow4 (Css.px 0) (Css.px 4) (Css.px 6) (Css.rgba 0 0 0 0.1)


overflowHidden : Css.Style
overflowHidden =
    Css.overflow Css.hidden


positionSticky : Css.Style
positionSticky =
    Css.position Css.sticky


topPx : Float -> Css.Style
topPx =
    toPx >> Css.top


leftPx : Float -> Css.Style
leftPx =
    toPx >> Css.left


verticalAlignMiddle : Css.Style
verticalAlignMiddle =
    Css.verticalAlign Css.middle


lastChild : List Css.Style -> Css.Style
lastChild =
    Css.lastChild
