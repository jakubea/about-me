module Atom.Button exposing (default, withDropdown)

import Css
import Html.Styled as Html exposing (Attribute, Html)
import Html.Styled.Attributes as Attributes
import Html.Styled.Events as Events
import Theme
import Util.Css as CssUtil
import Util.Layout as Layout


view : String -> msg -> List (Attribute msg) -> List Css.Style -> List (Html msg) -> Html msg
view ariaLabel msg extraAttributes extraStyle =
    Html.button
        ([ Attributes.type_ "button"
         , Attributes.attribute "aria-label" ariaLabel
         , Events.onClick msg
         , [ CssUtil.padding2 5 9
           , CssUtil.cursorPointer
           ]
            ++ extraStyle
            |> Attributes.css
         ]
            ++ extraAttributes
        )


default : msg -> String -> List (Html msg) -> Html msg
default msg ariaLabel =
    let
        baseStyles =
            [ CssUtil.color Theme.color.textLight
            , CssUtil.hover
                [ CssUtil.color Theme.color.accent
                , CssUtil.borderRadius 999
                ]
            ]
    in
    view ariaLabel msg [] baseStyles


withDropdown : Bool -> msg -> String -> List (Html msg) -> Html msg
withDropdown isDropdownOpen msg ariaLabel =
    view ariaLabel
        msg
        [ Attributes.attribute "aria-haspopup" "menu"
        , Attributes.attribute "aria-expanded"
            (if isDropdownOpen then
                "true"

             else
                "false"
            )
        , Events.onFocus msg
        ]
        [ Layout.displayFlex
        , Layout.alignItemsCenter
        , CssUtil.backgroundColor Theme.color.accent
        , CssUtil.color Theme.color.white
        , CssUtil.borderRadius 999
        , CssUtil.padding2 5 9
        , CssUtil.fontSize Theme.fontSize.xs
        , CssUtil.fontWeight 700
        , CssUtil.cursorPointer
        , CssUtil.transition [ "transform", "box-shadow" ]
        ]
