module Organism.Navigation exposing (view)

import Atom.Icon as Icon
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Route exposing (Route)
import Theme
import Util.Css as CssUtil


navItem : Bool -> String -> Html msg -> Route -> Html msg
navItem isActive label icon route =
    Html.a
        [ Attributes.href (Route.toPath route)
        , Attributes.css
            [ Css.displayFlex
            , CssUtil.itemsCenter
            , CssUtil.gap 6
            , Css.padding (Css.px 8)
            , Css.paddingLeft (Css.px 12)
            , Css.paddingRight (Css.px 12)
            , CssUtil.roundedLg
            , Css.borderBottom3 (Css.px 2)
                Css.solid
                (if isActive then
                    Theme.color.accent

                 else
                    Css.rgba 0 0 0 0
                )
            , CssUtil.color
                (if isActive then
                    Theme.color.accent

                 else
                    Theme.color.textLight
                )
            , Css.textDecoration Css.none
            , Css.fontWeight
                (if isActive then
                    Css.int 700

                 else
                    Css.int 500
                )
            , Css.fontSize (Css.px Theme.fontSize.sm)
            , CssUtil.transition [ "color", "border-color" ]
            , Css.hover
                [ CssUtil.color Theme.color.accent
                ]
            , Css.focus
                [ Css.outline3 (Css.px 2) Css.solid Theme.color.accent
                , Css.outlineOffset (Css.px 2)
                ]
            ]
        ]
        [ Html.span [ Attributes.css [ Css.displayFlex ] ] [ icon ]
        , Html.text label
        ]


view : Route -> Html msg
view currentRoute =
    Html.nav
        [ Attributes.css
            [ CssUtil.backgroundColor Theme.color.surface
            , CssUtil.borderBottom Theme.color.border 1
            , Css.paddingTop (Css.px 12)
            , Css.paddingBottom (Css.px 12)
            , Css.paddingLeft (Css.px 16)
            , Css.paddingRight (Css.px 16)
            , Css.position Css.sticky
            , Css.top (Css.px 0)
            , Css.zIndex (Css.int 10)
            ]
        , Attributes.attribute "aria-label" "Main navigation"
        ]
        [ Html.div
            [ Attributes.css
                [ CssUtil.container
                , CssUtil.flex
                , CssUtil.gap 4
                , Css.flexWrap Css.wrap
                ]
            ]
            [ navItem (currentRoute == Route.Home) "Home" Icon.home Route.Home
            , navItem (currentRoute == Route.Experience) "Experience" Icon.briefcase Route.Experience
            , navItem (currentRoute == Route.Projects) "Projects" Icon.code Route.Projects
            , navItem (currentRoute == Route.Skills) "Skills" Icon.target Route.Skills
            ]
        ]
