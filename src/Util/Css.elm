module Util.Css exposing (active, after, backgroundColor, backgroundColorTransparent, before, border, borderBottom, borderColor, borderDotted, borderRadius, borderRadius4, borderRadiusPct, borderStyleNone, borderTop, borderWidth, borderWidth4, bottomPct, bottomPx, boxShadow4, boxSizingBorderBox, calcMinus, color, container, cursorNotAllowed, cursorPointer, flex, flexColumn, flexRow, focus, fontFamilyInherit, fontSize, fontWeight, fullFill, gap, gapPx, height, heightAuto, heightPct, heightPx, heightVh, hover, itemsCenter, justifyCenter, leftPct, leftPx, lineHeight, listStyleNone, margin, marginBottom, marginLeft, marginRight, marginTop, marginZero, maxHeightPct, maxHeightPx, maxHeightVh, maxWidth, maxWidthPct, maxWidthPx, maxWidthVw, minHeight, minHeightVh, minWidth, mxAuto, nthChild, opacity, outline3, outlineColor, outlineNone, outlineOffset, overflowAuto, overflowHidden, overflowWrapBreakWord, overflowXAuto, overflowYAuto, padding, padding2, padding4, pointerEventsNone, propertyContent, rightPct, rightPx, roundedFull, roundedLg, shadowMd, shadowSm, textAlignCenter, textAlignLeft, textAlignRight, textCenter, textDecorationNone, textDecorationUnderline, toHex, toPx, toVh, toVw, topPct, topPx, transformTranslateXPct, transition, transitionAllLinear, wFull, whiteSpaceNoWrap, whiteSpaceNormal, whiteSpacePre, whiteSpacePreWrap, width, widthPct, widthVw, wordBreakBreakWord, zIndex)

import Css


backgroundColor : Css.Color -> Css.Style
backgroundColor =
    Css.backgroundColor


backgroundColorTransparent : Css.Style
backgroundColorTransparent =
    Css.backgroundColor Css.transparent


border : Css.Color -> Float -> Css.Style
border color_ borderWidth_ =
    Css.border3 (toPx borderWidth_) Css.solid color_


borderDotted : Css.Color -> Float -> Css.Style
borderDotted color_ borderWidth_ =
    Css.border3 (toPx borderWidth_) Css.dotted color_


borderColor : Css.Color -> Css.Style
borderColor =
    Css.borderColor


borderStyleNone : Css.Style
borderStyleNone =
    Css.borderStyle Css.none


borderTop : Css.Color -> Float -> Css.Style
borderTop color_ borderWidth_ =
    Css.borderTop3 (toPx borderWidth_) Css.solid color_


borderBottom : Css.Color -> Float -> Css.Style
borderBottom color_ borderWidth_ =
    Css.borderBottom3 (toPx borderWidth_) Css.solid color_


borderWidth : Float -> Css.Style
borderWidth =
    toPx >> Css.borderWidth


borderWidth4 : Float -> Float -> Float -> Float -> Css.Style
borderWidth4 top right bottom left =
    Css.borderWidth4 (toPx top) (toPx right) (toPx bottom) (toPx left)


borderRadius : Float -> Css.Style
borderRadius =
    toPx >> Css.borderRadius


borderRadius4 : Float -> Float -> Float -> Float -> Css.Style
borderRadius4 topLeft topRight bottomRight bottomLeft =
    Css.borderRadius4 (toPx topLeft) (toPx topRight) (toPx bottomRight) (toPx bottomLeft)


borderRadiusPct : Float -> Css.Style
borderRadiusPct =
    toPct >> Css.borderRadius


bottomPct : Float -> Css.Style
bottomPct =
    toPct >> Css.bottom


bottomPx : Float -> Css.Style
bottomPx =
    toPx >> Css.bottom


boxShadow4 : Float -> Float -> Float -> Css.Color -> Css.Style
boxShadow4 offset blur spread =
    Css.boxShadow4 (toPx offset) (toPx blur) (toPx spread)


boxSizingBorderBox : Css.Style
boxSizingBorderBox =
    Css.boxSizing Css.borderBox


calcMinus : Css.Calc compatibleA -> Css.Calc compatibleB -> Css.CalculatedLength
calcMinus compatibleA =
    Css.calc compatibleA Css.minus


color : Css.Color -> Css.Style
color =
    Css.color


cursorNotAllowed : Css.Style
cursorNotAllowed =
    Css.cursor Css.notAllowed


cursorPointer : Css.Style
cursorPointer =
    Css.cursor Css.pointer


fontFamilyInherit : Css.Style
fontFamilyInherit =
    Css.fontFamily Css.inherit


fontSize : Float -> Css.Style
fontSize =
    toPx >> Css.fontSize


fontWeight : Int -> Css.Style
fontWeight =
    Css.int >> Css.fontWeight


fullFill : Css.Style
fullFill =
    Css.batch
        [ Css.top Css.zero
        , Css.bottom Css.zero
        , Css.left Css.zero
        , Css.right Css.zero
        ]


gap : Float -> Css.Style
gap gapValue =
    Css.property "gap" (String.fromFloat gapValue ++ "px")


gapPx : Float -> Css.Style
gapPx =
    gap


leftPx : Float -> Css.Style
leftPx =
    toPx >> Css.left


leftPct : Float -> Css.Style
leftPct =
    toPct >> Css.left


lineHeight : Float -> Css.Style
lineHeight =
    toPx >> Css.lineHeight


listStyleNone : Css.Style
listStyleNone =
    Css.listStyle Css.none


marginBottom : Float -> Css.Style
marginBottom =
    toPx >> Css.marginBottom


marginLeft : Float -> Css.Style
marginLeft =
    toPx >> Css.marginLeft


marginRight : Float -> Css.Style
marginRight =
    toPx >> Css.marginRight


marginTop : Float -> Css.Style
marginTop =
    toPx >> Css.marginTop


marginZero : Css.Style
marginZero =
    Css.margin Css.zero


opacity : Float -> Css.Style
opacity =
    Css.num >> Css.opacity


outlineColor : Css.Color -> Css.Style
outlineColor =
    Css.outlineColor


outlineNone : Css.Style
outlineNone =
    Css.outline Css.none


outlineOffset : Float -> Css.Style
outlineOffset =
    toPx >> Css.outlineOffset


outline3 : Float -> Css.Color -> Css.Style
outline3 width_ =
    Css.outline3 (Css.px width_) Css.solid


overflowAuto : Css.Style
overflowAuto =
    Css.overflow Css.auto


overflowXAuto : Css.Style
overflowXAuto =
    Css.overflowX Css.auto


overflowYAuto : Css.Style
overflowYAuto =
    Css.overflowY Css.auto


overflowHidden : Css.Style
overflowHidden =
    Css.overflow Css.hidden


overflowWrapBreakWord : Css.Style
overflowWrapBreakWord =
    Css.overflowWrap Css.breakWord


padding : Float -> Css.Style
padding value =
    padding4 value value value value


padding2 : Float -> Float -> Css.Style
padding2 topBottom rightLeft =
    padding4 topBottom rightLeft topBottom rightLeft


padding4 : Float -> Float -> Float -> Float -> Css.Style
padding4 paddingTop paddingRight paddingBottom paddingLeft =
    Css.padding4 (toPx paddingTop) (toPx paddingRight) (toPx paddingBottom) (toPx paddingLeft)


pointerEventsNone : Css.Style
pointerEventsNone =
    Css.pointerEvents Css.none


propertyContent : String -> Css.Style
propertyContent content =
    Css.property "content" ("'" ++ replaceSingleQuotes content ++ "'")


replaceSingleQuotes : String -> String
replaceSingleQuotes =
    String.replace "'" "’"


rightPct : Float -> Css.Style
rightPct =
    toPct >> Css.right


rightPx : Float -> Css.Style
rightPx =
    toPx >> Css.right


textAlignCenter : Css.Style
textAlignCenter =
    Css.textAlign Css.center


textCenter : Css.Style
textCenter =
    Css.textAlign Css.center


textAlignLeft : Css.Style
textAlignLeft =
    Css.textAlign Css.left


textAlignRight : Css.Style
textAlignRight =
    Css.textAlign Css.right


textDecorationNone : Css.Style
textDecorationNone =
    Css.textDecoration Css.none


textDecorationUnderline : Css.Style
textDecorationUnderline =
    Css.textDecoration Css.underline


topPct : Float -> Css.Style
topPct =
    toPct >> Css.top


topPx : Float -> Css.Style
topPx =
    toPx >> Css.top


transformTranslateXPct : Float -> Css.Style
transformTranslateXPct =
    toPct >> Css.translateX >> Css.transform


transitionAllLinear : Css.Style
transitionAllLinear =
    Css.property "transition" "all 0.3s linear"


whiteSpaceNormal : Css.Style
whiteSpaceNormal =
    Css.whiteSpace Css.normal


whiteSpaceNoWrap : Css.Style
whiteSpaceNoWrap =
    Css.whiteSpace Css.noWrap


whiteSpacePre : Css.Style
whiteSpacePre =
    Css.whiteSpace Css.pre


whiteSpacePreWrap : Css.Style
whiteSpacePreWrap =
    Css.whiteSpace Css.preWrap


zIndex : Int -> Css.Style
zIndex =
    Css.int >> Css.zIndex



-- SIZE


height : Css.LengthOrAuto compatible -> Css.Style
height =
    Css.height


heightPx : Float -> Css.Style
heightPx =
    toPx >> height


heightAuto : Css.Style
heightAuto =
    height Css.auto


heightPct : Float -> Css.Style
heightPct =
    toPct >> height


heightVh : Float -> Css.Style
heightVh =
    toVh >> height


maxHeightPx : Float -> Css.Style
maxHeightPx =
    Css.px >> Css.maxHeight


maxHeightVh : Float -> Css.Style
maxHeightVh =
    toVh >> Css.maxHeight


maxHeightPct : Float -> Css.Style
maxHeightPct =
    toPct >> Css.maxHeight


minHeight : Float -> Css.Style
minHeight =
    toPx >> Css.minHeight


minHeightVh : Float -> Css.Style
minHeightVh =
    toVh >> Css.minHeight


maxWidth : Css.LengthOrNoneOrMinMaxDimension compatible -> Css.Style
maxWidth =
    Css.maxWidth


maxWidthPct : Float -> Css.Style
maxWidthPct =
    toPct >> maxWidth


maxWidthPx : Float -> Css.Style
maxWidthPx =
    toPx >> maxWidth


maxWidthVw : Float -> Css.Style
maxWidthVw =
    toVw >> maxWidth


minWidth : Float -> Css.Style
minWidth =
    toPx >> Css.minWidth


width : Float -> Css.Style
width =
    toPx >> Css.width


widthPct : Float -> Css.Style
widthPct =
    toPct >> Css.width


widthVw : Float -> Css.Style
widthVw =
    toVw >> Css.width


wordBreakBreakWord : Css.Style
wordBreakBreakWord =
    Css.property "word-break" "break-word"



-- PSEUDOCLASSES


active : List Css.Style -> Css.Style
active =
    Css.active


after : List Css.Style -> Css.Style
after =
    Css.after


before : List Css.Style -> Css.Style
before =
    Css.before


focus : List Css.Style -> Css.Style
focus =
    Css.focus


hover : List Css.Style -> Css.Style
hover =
    Css.hover


nthChild : String -> List Css.Style -> Css.Style
nthChild =
    Css.nthChild



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


toVh : Float -> Css.Vh
toVh =
    Css.vh


toVw : Float -> Css.Vw
toVw =
    Css.vw


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


wFull : Css.Style
wFull =
    Css.width (Css.pct 100)


mxAuto : Css.Style
mxAuto =
    Css.batch
        [ Css.marginLeft Css.auto
        , Css.marginRight Css.auto
        ]


roundedLg : Css.Style
roundedLg =
    Css.borderRadius (Css.px 8)


roundedFull : Css.Style
roundedFull =
    Css.borderRadius (Css.px 9999)


shadowSm : Css.Style
shadowSm =
    Css.boxShadow4 (Css.px 0) (Css.px 1) (Css.px 2) (Css.rgba 0 0 0 0.05)


shadowMd : Css.Style
shadowMd =
    Css.boxShadow4 (Css.px 0) (Css.px 4) (Css.px 6) (Css.rgba 0 0 0 0.1)
