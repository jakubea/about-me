module Atom.Icon exposing
    ( briefcase
    , code
    , github
    , heart
    , home
    , linkedin
    , mail
    , mapPin
    , phone
    , target
    )

import Css
import Html.Styled exposing (Attribute, Html)
import Svg.Styled as Svg exposing (Svg)
import Svg.Styled.Attributes as SvgAttributes
import Util.Css as CssUtil



-- HELPERS


svg : List (Attribute msg) -> List (Svg msg) -> Html msg
svg attrs children =
    Svg.svg attrs children



-- ICONS


home : Svg msg
home =
    svg
        [ SvgAttributes.css
            [ CssUtil.width 24
            , Css.height (Css.px 24)
            , Css.display Css.inlineBlock
            , Css.verticalAlign Css.middle
            ]
        , SvgAttributes.stroke "currentColor"
        , SvgAttributes.viewBox "0 0 24 24"
        , SvgAttributes.fill "none"
        , SvgAttributes.strokeWidth "2"
        , SvgAttributes.strokeLinecap "round"
        , SvgAttributes.strokeLinejoin "round"
        ]
        [ Svg.path [ SvgAttributes.d "M3 12h18M12 3v18m-9-9l9-9 9 9" ] [] ]


briefcase : Html msg
briefcase =
    svg
        [ SvgAttributes.css
            [ CssUtil.width 24
            , Css.height (Css.px 24)
            , Css.display Css.inlineBlock
            , Css.verticalAlign Css.middle
            ]
        , SvgAttributes.stroke "currentColor"
        , SvgAttributes.viewBox "0 0 24 24"
        , SvgAttributes.fill "none"
        , SvgAttributes.strokeWidth "2"
        , SvgAttributes.strokeLinecap "round"
        , SvgAttributes.strokeLinejoin "round"
        ]
        [ Svg.rect [ SvgAttributes.x "2", SvgAttributes.y "7", SvgAttributes.width "20", SvgAttributes.height "14", SvgAttributes.rx "2", SvgAttributes.ry "2" ] []
        , Svg.path [ SvgAttributes.d "M16 7V5a2 2 0 0 0-2-2H10a2 2 0 0 0-2 2v2" ] []
        ]


code : Html msg
code =
    svg
        [ SvgAttributes.css
            [ CssUtil.width 24
            , Css.height (Css.px 24)
            , Css.display Css.inlineBlock
            , Css.verticalAlign Css.middle
            ]
        , SvgAttributes.stroke "currentColor"
        , SvgAttributes.viewBox "0 0 24 24"
        , SvgAttributes.fill "none"
        , SvgAttributes.strokeWidth "2"
        , SvgAttributes.strokeLinecap "round"
        , SvgAttributes.strokeLinejoin "round"
        ]
        [ Svg.path [ SvgAttributes.d "M16 18l4-4-4-4M8 6l-4 4 4 4" ] [] ]


target : Html msg
target =
    svg
        [ SvgAttributes.css
            [ CssUtil.width 24
            , Css.height (Css.px 24)
            , Css.display Css.inlineBlock
            , Css.verticalAlign Css.middle
            ]
        , SvgAttributes.stroke "currentColor"
        , SvgAttributes.viewBox "0 0 24 24"
        , SvgAttributes.fill "none"
        , SvgAttributes.strokeWidth "2"
        , SvgAttributes.strokeLinecap "round"
        , SvgAttributes.strokeLinejoin "round"
        ]
        [ Svg.circle [ SvgAttributes.cx "12", SvgAttributes.cy "12", SvgAttributes.r "9" ] []
        , Svg.circle [ SvgAttributes.cx "12", SvgAttributes.cy "12", SvgAttributes.r "5" ] []
        , Svg.circle [ SvgAttributes.cx "12", SvgAttributes.cy "12", SvgAttributes.r "1" ] []
        ]


github : Html msg
github =
    svg
        [ SvgAttributes.css
            [ CssUtil.width 24
            , Css.height (Css.px 24)
            , Css.display Css.inlineBlock
            , Css.verticalAlign Css.middle
            ]
        , SvgAttributes.fill "currentColor"
        , SvgAttributes.viewBox "0 0 24 24"
        ]
        [ Svg.path [ SvgAttributes.d "M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z" ] [] ]


linkedin : Html msg
linkedin =
    svg
        [ SvgAttributes.css
            [ CssUtil.width 24
            , Css.height (Css.px 24)
            , Css.display Css.inlineBlock
            , Css.verticalAlign Css.middle
            ]
        , SvgAttributes.fill "currentColor"
        , SvgAttributes.viewBox "0 0 24 24"
        ]
        [ Svg.path [ SvgAttributes.d "M20.447 20.452h-3.554v-5.569c0-1.328-.475-2.236-1.986-2.236-1.081 0-1.722.722-2.006 1.422-.103.249-.129.597-.129.946v5.437h-3.555V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.931-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.134-.924 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.225 0z" ] [] ]


mail : Html msg
mail =
    svg
        [ SvgAttributes.css
            [ CssUtil.width 24
            , Css.height (Css.px 24)
            , Css.display Css.inlineBlock
            , Css.verticalAlign Css.middle
            ]
        , SvgAttributes.stroke "currentColor"
        , SvgAttributes.viewBox "0 0 24 24"
        , SvgAttributes.fill "none"
        , SvgAttributes.strokeWidth "2"
        , SvgAttributes.strokeLinecap "round"
        , SvgAttributes.strokeLinejoin "round"
        ]
        [ Svg.rect [ SvgAttributes.x "2", SvgAttributes.y "4", SvgAttributes.width "20", SvgAttributes.height "16", SvgAttributes.rx "2" ] []
        , Svg.path [ SvgAttributes.d "m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7" ] []
        ]


phone : Html msg
phone =
    svg
        [ SvgAttributes.css
            [ CssUtil.width 24
            , Css.height (Css.px 24)
            , Css.display Css.inlineBlock
            , Css.verticalAlign Css.middle
            ]
        , SvgAttributes.stroke "currentColor"
        , SvgAttributes.viewBox "0 0 24 24"
        , SvgAttributes.fill "none"
        , SvgAttributes.strokeWidth "2"
        , SvgAttributes.strokeLinecap "round"
        , SvgAttributes.strokeLinejoin "round"
        ]
        [ Svg.path [ SvgAttributes.d "M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z" ] [] ]


mapPin : Html msg
mapPin =
    svg
        [ SvgAttributes.css
            [ CssUtil.width 24
            , Css.height (Css.px 24)
            , Css.display Css.inlineBlock
            , Css.verticalAlign Css.middle
            ]
        , SvgAttributes.stroke "currentColor"
        , SvgAttributes.viewBox "0 0 24 24"
        , SvgAttributes.fill "none"
        , SvgAttributes.strokeWidth "2"
        , SvgAttributes.strokeLinecap "round"
        , SvgAttributes.strokeLinejoin "round"
        ]
        [ Svg.path [ SvgAttributes.d "M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z" ] []
        , Svg.circle [ SvgAttributes.cx "12", SvgAttributes.cy "10", SvgAttributes.r "3" ] []
        ]


heart : Html msg
heart =
    svg
        [ SvgAttributes.css
            [ CssUtil.width 24
            , Css.height (Css.px 24)
            , Css.display Css.inlineBlock
            , Css.verticalAlign Css.middle
            ]
        , SvgAttributes.fill "currentColor"
        , SvgAttributes.viewBox "0 0 24 24"
        ]
        [ Svg.path [ SvgAttributes.d "M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" ] [] ]
