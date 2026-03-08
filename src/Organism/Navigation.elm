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
            [ CssUtil.displayFlex
            , CssUtil.itemsCenter
            , CssUtil.gapPx 6
            , Css.padding (Css.px 8)
            , Css.paddingLeft (Css.px 12)
            , Css.paddingRight (Css.px 12)
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
            , CssUtil.fontSize Theme.fontSize.sm
            , CssUtil.transition [ "color", "border-color" ]
            , Css.hover
                [ CssUtil.color Theme.color.accent
                ]
            ]
        ]
        [ icon
        , Html.text label
        ]


view : Route -> Html msg
view currentRoute =
    Html.nav
        [ Attributes.css
            [ CssUtil.backgroundColor Theme.color.surface
            , CssUtil.borderBottom Theme.color.border 1
            , CssUtil.paddingTop 12
            , Css.paddingBottom (Css.px 12)
            , Css.paddingLeft (Css.px 16)
            , Css.paddingRight (Css.px 16)
            , Css.position Css.sticky
            , Css.top (Css.px 0)
            , CssUtil.property "background-image" "linear-gradient(180deg, #232326 0%, #000 100%)"
            , CssUtil.zIndex 10
            ]
        , Attributes.attribute "aria-label" "Main navigation"
        ]
        [ Html.div
            [ Attributes.css
                [ CssUtil.container
                , CssUtil.flex
                , CssUtil.gapPx 4
                , CssUtil.flexWrapWrap
                ]
            ]
            [ navItem (currentRoute == Route.Home) "Home" Icon.home Route.Home
            , navItem (currentRoute == Route.Experience) "Experience" Icon.briefcase Route.Experience
            , navItem (currentRoute == Route.Projects) "Projects" Icon.code Route.Projects
            , navItem (currentRoute == Route.Skills) "Skills" Icon.target Route.Skills
            , navItem (currentRoute == Route.Elm)
                "Elm skills"
                (Html.img
                    [ Attributes.src "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Elm_logo.svg/1280px-Elm_logo.svg.png?_=20160911065740"
                    , Attributes.alt "Elm logo"
                    , Attributes.css
                        [ Css.height (Css.px 22)
                        , Css.width (Css.px 22)
                        , Css.marginRight (Css.px 2)
                        , Css.verticalAlign Css.middle
                        ]
                    ]
                    []
                )
                Route.Elm
            , navItem (currentRoute == Route.Languages) "Languages" Icon.globe Route.Languages
            ]
        ]
