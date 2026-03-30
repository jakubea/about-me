module Atom.Button exposing (view)

import Html.Styled as Html exposing (Html)


view : List (Html.Attribute msg) -> List (Html msg) -> Html msg
view attributes children =
    Html.button attributes children
