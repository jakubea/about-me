module Organism.Navigation exposing (view)

import Atom.Icon as Icon
import Atom.Link as Link
import Atom.Text as Text
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import I18n
import Route exposing (Route)
import Taco
import Theme
import Types exposing (LanguageCode)
import Util.Css as CssUtil
import Util.Layout as Layout


navItem : Bool -> String -> Html msg -> Route -> Html msg
navItem isActive label icon route =
    let
        ( activeStyles, color ) =
            if isActive then
                ( [ CssUtil.backgroundColor Theme.color.surface
                  , CssUtil.roundedLg
                  ]
                , Theme.color.accent
                )

            else
                ( [], Theme.color.textLight )
    in
    Layout.flexRow [ CssUtil.gapPx 6 ]
        [ icon, String.toUpper label |> Text.view [] ]
        |> Link.navLink (Route.toPath route)
            isActive
            ([ Layout.alignItemsCenter
             , CssUtil.padding2 8 12
             , CssUtil.roundedLg
             , CssUtil.color color
             , CssUtil.textDecorationNone
             , CssUtil.transition [ "color", "transform", "background-color", "box-shadow" ]
             , CssUtil.hover
                [ CssUtil.color Theme.color.accent
                , CssUtil.property "transform" "translate3d(0, -1px, 0)"
                , CssUtil.property "background" "rgba(255, 255, 255, 0.04)"
                ]
             , CssUtil.focus
                [ CssUtil.outlineNone
                , CssUtil.boxShadowValue "0 0 0 1px rgba(255, 45, 45, 0.55)"
                ]
             ]
                ++ activeStyles
            )


translateFn : I18n.Translators -> String -> String
translateFn translators =
    I18n.translateFn translators "Organism.Navigation."


view : Taco.Taco -> Route -> Bool -> msg -> msg -> (LanguageCode -> msg) -> Html msg
view taco currentRoute _ _ _ _ =
    let
        translators =
            Taco.getTranslators taco
    in
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
                [ Layout.displayFlex
                , Layout.justifyContentSpaceBetween
                , Layout.alignItemsCenter
                , Layout.flexWrapWrap
                , CssUtil.gapPx 12
                ]
            ]
            [ Layout.flexRow [ CssUtil.gapPx 4, Layout.flexWrapWrap ]
                [ navItem (currentRoute == Route.Home) (translateFn translators "home") Icon.home Route.Home
                , navItem (currentRoute == Route.Experience) (translateFn translators "experience") Icon.briefcase Route.Experience
                , navItem (currentRoute == Route.Projects) (translateFn translators "projects") Icon.code Route.Projects
                , navItem (currentRoute == Route.Skills) (translateFn translators "skills") Icon.target Route.Skills
                , navItem (currentRoute == Route.Elm)
                    (translateFn translators "elmSkills")
                    (Html.img
                        [ Attributes.src "/elm-logo.svg"
                        , Attributes.alt "Elm logo"
                        , Attributes.css
                            [ CssUtil.heightPx 22
                            , CssUtil.widthPx 22
                            , CssUtil.marginRight 2
                            ]
                        ]
                        []
                    )
                    Route.Elm
                , navItem (currentRoute == Route.Languages) (translateFn translators "languages") Icon.globe Route.Languages
                ]

            -- TODO: Add translations
            -- , LanguageSelector.view (Taco.getLanguage taco) isLanguageMenuOpen openLanguageMenu closeLanguageMenu toLanguageMsg
            ]
        ]
