module Molecule.LanguageSelector exposing (view)

import Atom.Button as Button
import Atom.Text as Text
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Html.Styled.Events as Events
import Theme
import Util.Css as CssUtil
import Util.Layout as Layout


type alias LanguageOption =
    { code : String
    , label : String
    }


languageOptions : List LanguageOption
languageOptions =
    [ { code = "en", label = "English" }
    , { code = "es", label = "Español" }
    , { code = "sk", label = "Slovensky" }
    , { code = "cs", label = "Čeština" }
    ]


otherLanguageOptions : String -> List LanguageOption
otherLanguageOptions selectedLanguage =
    List.filter (.code >> (/=) selectedLanguage) languageOptions


languageButton : (String -> msg) -> LanguageOption -> Html msg
languageButton toMsg option =
    let
        baseStyles =
            [ CssUtil.backgroundColor Theme.color.surface
            , CssUtil.color Theme.color.textLight
            , CssUtil.hover
                [ CssUtil.backgroundColor Theme.color.accent
                , CssUtil.color Theme.color.white
                ]
            ]
    in
    Button.view
        [ Attributes.type_ "button"
        , Attributes.attribute "aria-label" ("Switch language to " ++ option.label)
        , Events.onClick (toMsg option.code)
        , Attributes.css
            ([ CssUtil.border Theme.color.border 1
             , CssUtil.borderRadius 999
             , CssUtil.padding2 5 9
             , CssUtil.property "cursor" "pointer"
             , CssUtil.property "appearance" "none"
             , CssUtil.transition [ "background-color", "color", "border-color" ]
             , CssUtil.fontSize Theme.fontSize.xs
             , CssUtil.fontWeight 700
             , CssUtil.property "letter-spacing" "0.06em"
             , Css.textTransform Css.uppercase
             ]
                ++ baseStyles
            )
        ]
        [ Text.view [ Text.small ] option.code ]


selectedLanguageTrigger : String -> Bool -> msg -> Html msg
selectedLanguageTrigger selectedLanguage isOpen openMsg =
    Button.view
        [ Attributes.type_ "button"
        , Attributes.attribute "aria-label" ("Current language " ++ String.toUpper selectedLanguage ++ ", show language options")
        , Attributes.attribute "aria-haspopup" "menu"
        , Attributes.attribute "aria-expanded"
            (if isOpen then
                "true"

             else
                "false"
            )
        , Events.onFocus openMsg
        , Events.onClick openMsg
        , Attributes.css
            [ Layout.displayFlex
            , Layout.alignItemsCenter
            , CssUtil.backgroundColor Theme.color.accent
            , CssUtil.color Theme.color.white
            , CssUtil.borderRadius 999
            , CssUtil.padding2 5 9
            , CssUtil.fontSize Theme.fontSize.xs
            , CssUtil.fontWeight 700
            , CssUtil.property "letter-spacing" "0.06em"
            , Css.textTransform Css.uppercase
            , CssUtil.property "cursor" "pointer"
            , CssUtil.property "appearance" "none"
            , CssUtil.transition [ "transform", "box-shadow" ]
            ]
        ]
        [ Text.view [ Text.small ] selectedLanguage ]


view : String -> Bool -> msg -> msg -> (String -> msg) -> Html msg
view selectedLanguage isOpen openMsg closeMsg toMsg =
    Html.div
        [ Events.onMouseEnter openMsg
        , Events.onMouseLeave closeMsg
        , Attributes.css
            [ Layout.positionRelative
            , Layout.displayFlex
            , Layout.alignItemsCenter
            ]
        ]
        [ Html.div
            [ Attributes.css
                [ Layout.displayFlex
                , Layout.alignItemsCenter
                ]
            ]
            [ selectedLanguageTrigger (String.toUpper selectedLanguage) isOpen openMsg ]
        , if isOpen then
            Html.div
                [ Attributes.attribute "role" "menu"
                , Attributes.attribute "aria-label" "Other languages"
                , Attributes.css
                    [ Layout.positionAbsolute
                    , CssUtil.topPx 28
                    , CssUtil.property "right" "0"
                    , Layout.displayFlex
                    , Layout.flexDirectionColumn
                    , CssUtil.property "align-items" "flex-end"
                    , CssUtil.gapPx 4
                    , CssUtil.padding 4
                    , CssUtil.borderRadius 12
                    , CssUtil.backgroundColor Theme.color.primary
                    , CssUtil.border Theme.color.border 1
                    , CssUtil.shadowMd
                    , CssUtil.zIndex 20
                    ]
                ]
                (List.map (languageButton toMsg) (otherLanguageOptions selectedLanguage))

          else
            Text.none
        ]
