module Molecule.LanguageSelector exposing (view)

import Atom.Button as Button
import Atom.Text as Text
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Html.Styled.Events as Events
import Html.Styled.Extra as HtmlExtra
import Theme
import Types exposing (LanguageCode)
import Util.Css as CssUtil
import Util.Layout as Layout
import Util.Parser as Parser


otherLanguageOptions : LanguageCode -> List LanguageCode
otherLanguageOptions selectedLanguage =
    List.filter ((/=) selectedLanguage) Types.allLanguageCodes


languageButtonView : (LanguageCode -> msg) -> LanguageCode -> Html msg
languageButtonView toMsg option =
    Button.default
        (toMsg option)
        ("Switch language to " ++ Parser.languageCodeToString option)
        [ Parser.languageCodeToString option |> String.toUpper |> Text.view [ Text.small ] ]


selectedLanguageView : String -> Bool -> msg -> Html msg
selectedLanguageView selectedLanguage isOpen openMsg =
    Button.withDropdown isOpen
        openMsg
        ("Current language " ++ String.toUpper selectedLanguage ++ ", show language options")
        [ String.toUpper selectedLanguage |> Text.view [ Text.small ] ]


view : LanguageCode -> Bool -> msg -> msg -> (LanguageCode -> msg) -> Html msg
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
        [ Layout.flexColumn [ Layout.displayFlex, Layout.alignItemsCenter ]
            [ selectedLanguageView (Parser.languageCodeToString selectedLanguage |> String.toUpper) isOpen openMsg ]
        , Html.div
            [ Attributes.attribute "role" "menu"
            , Attributes.attribute "aria-label" "Other languages"
            , Attributes.css
                [ Layout.positionAbsolute
                , CssUtil.topPx 28
                , CssUtil.rightPx 0
                , Layout.displayFlex
                , Layout.flexDirectionColumn
                , Layout.alignItemsFlexEnd
                , CssUtil.gapPx 4
                , CssUtil.padding 4
                , CssUtil.borderRadius 12
                , CssUtil.backgroundColor Theme.color.primary
                , CssUtil.border Theme.color.border 1
                , CssUtil.shadowMd
                , CssUtil.zIndex 20
                ]
            ]
            (List.map
                (languageButtonView toMsg
                    >> Layout.spacing
                        [ CssUtil.borderBottom Theme.color.white 1
                        , CssUtil.lastChild [ CssUtil.borderBottom Theme.color.white 0 ]
                        ]
                )
                (otherLanguageOptions selectedLanguage)
            )
            |> HtmlExtra.viewIf isOpen
        ]
