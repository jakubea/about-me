module Util.Motion exposing (revealStyle, revealStyleWithEasing)

import Css
import Css.Animations as Animations
import Util.Css as CssUtil


defaultEasing : String
defaultEasing =
    "cubic-bezier(0.22, 1, 0.36, 1)"


revealKeyframes : String -> Animations.Keyframes {}
revealKeyframes fromTransform =
    Animations.keyframes
        [ ( 0
          , [ Animations.opacity (Css.num 0)
            , Animations.property "transform" fromTransform
            ]
          )
        , ( 100
          , [ Animations.opacity (Css.num 1)
            , Animations.property "transform" "translate3d(0, 0, 0) scale(1)"
            ]
          )
        ]


revealStyle : String -> Float -> Float -> List Css.Style
revealStyle fromTransform durationMs delayMs =
    revealStyleWithEasing defaultEasing fromTransform durationMs delayMs


revealStyleWithEasing : String -> String -> Float -> Float -> List Css.Style
revealStyleWithEasing easing fromTransform durationMs delayMs =
    [ CssUtil.opacity 0
    , CssUtil.animationName (revealKeyframes fromTransform)
    , CssUtil.animationDurationMs durationMs
    , CssUtil.animationDelayMs delayMs
    , CssUtil.property "animation-fill-mode" "both"
    , CssUtil.property "animation-timing-function" easing
    , CssUtil.willChangeOpacityTransform
    ]
