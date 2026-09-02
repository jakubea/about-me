module Page.Home exposing (view)

import Atom.Heading as Heading
import Atom.Text as Text
import Css
import Css.Animations as Animations
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import I18n
import Taco exposing (Taco)
import Theme
import Time
import Time.Extra
import Util.Css as CssUtil
import Util.Layout as Layout
import Util.Motion as Motion


translateFn : I18n.Translators -> String -> String
translateFn translators =
    I18n.translateFn translators translationPath


translationPath : String
translationPath =
    "Page.Home."


photoDriftKeyframes : Animations.Keyframes {}
photoDriftKeyframes =
    Animations.keyframes
        [ ( 0
          , [ Animations.property "transform" "translate3d(0, 0, 0) scale(1)"
            ]
          )
        , ( 50
          , [ Animations.property "transform" "translate3d(0, -3px, 0) scale(1.01)"
            ]
          )
        , ( 100
          , [ Animations.property "transform" "translate3d(0, -4px, 0) scale(1.01)"
            ]
          )
        ]


photoWrapMotion : List Css.Style
photoWrapMotion =
    [ CssUtil.transition [ "transform", "box-shadow", "border-color" ]
    , CssUtil.willChangeTransform
    , CssUtil.hover
        [ CssUtil.property "transform" "translate3d(0, -3px, 0) scale(1.02)"
        , CssUtil.boxShadowValue "0 9px 18px rgba(0, 0, 0, 0.16)"
        ]
    ]


photoDriftMotion : List Css.Style
photoDriftMotion =
    [ CssUtil.animationName photoDriftKeyframes
    , CssUtil.animationDurationMs 4200
    , Css.property "animation-direction" "alternate"
    , Css.property "animation-iteration-count" "infinite"
    , Css.property "animation-timing-function" "ease-in-out"
    , CssUtil.transition [ "transform" ]
    ]


heroHeadingMotion : Float -> List Css.Style
heroHeadingMotion delayMs =
    Motion.revealStyle "translate3d(0, 12px, 0) scale(0.985)" 560 delayMs


heroLineMotion : Int -> List Css.Style
heroLineMotion idx =
    Motion.revealStyle "translate3d(0, 10px, 0) scale(0.98)" 480 (toFloat (140 + (idx * 55)))


heroImageMotion : List Css.Style
heroImageMotion =
    Motion.revealStyle "translate3d(24px, 0, 0) scale(0.94)" 700 160


view : Taco -> Html msg
view taco =
    let
        translators =
            Taco.getTranslators taco

        currentTime =
            Taco.getCurrentTime taco

        zone =
            Taco.getZone taco

        startDate =
            Time.Extra.partsToPosix zone (Time.Extra.Parts 2016 Time.Oct 1 0 0 0 0)

        years =
            Time.Extra.diff Time.Extra.Year zone startDate currentTime

        afterYears =
            Time.Extra.add Time.Extra.Year years zone startDate

        months =
            Time.Extra.diff Time.Extra.Month zone afterYears currentTime

        afterMonths =
            Time.Extra.add Time.Extra.Month months zone afterYears

        days =
            Time.Extra.diff Time.Extra.Day zone afterMonths currentTime

        introLines =
            translators.tr (translationPath ++ "experience")
                [ ( "years", String.fromInt years )
                , ( "months", String.fromInt months )
                , ( "days", String.fromInt days )
                ]
                :: List.map (translateFn translators) [ "ownership", "thinking", "background", "freeTime" ]
    in
    Html.section []
        [ Layout.flexRow [ Layout.flexWrapWrap, CssUtil.widthPct 100, Layout.alignItemsCenter, Layout.justifyContentCenter, CssUtil.gapPx 20 ]
            [ Layout.flexColumn
                [ Layout.displayFlex, Layout.flexDirectionColumn, Layout.alignItemsCenter, CssUtil.gapPx 10, CssUtil.maxWidth 620 ]
                [ Layout.flexColumn (heroHeadingMotion 20) [ translateFn translators "name" |> Heading.h1 ]
                , Layout.flexColumn (heroHeadingMotion 90) [ translateFn translators "title" |> Text.view [ Text.red, Text.bold, Text.large ] ]
                , introLines
                    |> List.indexedMap
                        (\idx line ->
                            Layout.flexColumn (heroLineMotion idx)
                                [ Text.view [ Text.grayLight, Text.center ] line ]
                        )
                    |> Layout.flexColumn [ Layout.alignItemsCenter, CssUtil.gapPx 10 ]
                ]
            , Layout.flexColumn
                (heroImageMotion
                    ++ photoWrapMotion
                    ++ [ CssUtil.widthPct 50
                       , CssUtil.widthPx 360
                       , CssUtil.heightPx 360
                       , CssUtil.property "aspect-ratio" "1 / 1"
                       , CssUtil.borderRadiusPct 50
                       , CssUtil.overflowHidden
                       , Layout.positionRelative
                       , CssUtil.backgroundColor Theme.color.primary
                       ]
                )
                [ Html.img
                    [ Attributes.src "/me.jpg"
                    , translateFn translators "profilePhotoAlt" |> Attributes.alt
                    , Attributes.css
                        (photoDriftMotion
                            ++ [ Layout.positionAbsolute
                               , CssUtil.topPx 0
                               , CssUtil.leftPx 0
                               , CssUtil.widthPct 100
                               , CssUtil.heightPct 100
                               , CssUtil.property "object-fit" "cover"
                               , CssUtil.property "object-position" "top"
                               , CssUtil.shadowMd
                               ]
                        )
                    ]
                    []
                ]
            ]
        ]
