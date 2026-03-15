module Organism.Navigation exposing (view)

import Atom.Icon as Icon
import Atom.Text as Text
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Route exposing (Route)
import Theme
import Util.Css as CssUtil


navItem : Bool -> String -> Html msg -> Route -> Html msg
navItem isActive label icon route =
    let
        ( borderBottom, color ) =
            if isActive then
                ( [ CssUtil.borderBottom Theme.color.accent 2 ], Theme.color.accent )

            else
                ( [], Theme.color.textLight )
    in
    Html.a
        [ Attributes.href (Route.toPath route)
        , Attributes.css
            ([ CssUtil.displayFlex
             , CssUtil.itemsCenter
             , CssUtil.gapPx 6
             , CssUtil.padding2 8 12
             , CssUtil.color color
             , CssUtil.textDecorationNone
             , CssUtil.hover [ CssUtil.color Theme.color.accent ]
             ]
                ++ borderBottom
            )
        ]
        [ icon
        , String.toUpper label |> Text.view []
        ]


view : Route -> Html msg
view currentRoute =
    Html.nav
        [ Attributes.css
            [ CssUtil.backgroundColor Theme.color.surface
            , CssUtil.padding2 12 16
            , CssUtil.positionSticky
            , CssUtil.topPx 0
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
                        [ CssUtil.heightPx 22
                        , CssUtil.widthPx 22
                        , CssUtil.marginRight 2
                        , CssUtil.verticalAlignMiddle
                        ]
                    ]
                    []
                )
                Route.Elm
            , navItem (currentRoute == Route.Languages) "Languages" Icon.globe Route.Languages
            ]
        ]
