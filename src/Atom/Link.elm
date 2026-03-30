module Atom.Link exposing (externalLink, externalLinkWithLabel, navLink)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes


navLink : String -> Bool -> List Css.Style -> Html msg -> Html msg
navLink targetPath isActive styles child =
    Html.a
        ([ Attributes.href targetPath
         , Attributes.tabindex 0
         , Attributes.attribute "role" "link"
         ]
            ++ ((if isActive then
                    [ Attributes.attribute "aria-current" "page" ]

                 else
                    []
                )
                    ++ [ Attributes.css styles ]
               )
        )
        [ child ]


externalLink : String -> List Css.Style -> Html msg -> Html msg
externalLink url styles child =
    Html.a
        [ Attributes.href url
        , Attributes.attribute "target" "_blank"
        , Attributes.attribute "rel" "noopener noreferrer"
        , Attributes.css styles
        ]
        [ child ]


externalLinkWithLabel : String -> String -> List Css.Style -> Html msg -> Html msg
externalLinkWithLabel url label styles child =
    Html.a
        [ Attributes.href url
        , Attributes.attribute "target" "_blank"
        , Attributes.attribute "rel" "noopener noreferrer"
        , Attributes.attribute "aria-label" label
        , Attributes.css styles
        ]
        [ child ]
