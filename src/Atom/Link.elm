module Atom.Link exposing (externalLink, externalLinkWithLabel, navLink)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes


type LinkTarget
    = Internal String
    | External String


type AriaCurrent
    = Page
    | Step
    | Location


ariaCurrentToString : AriaCurrent -> String
ariaCurrentToString current =
    case current of
        Page ->
            "page"

        Step ->
            "step"

        Location ->
            "location"


externalNoticeText : String
externalNoticeText =
    "opens in a new tab"



-- STYLES


srOnlyStyles : List Css.Style
srOnlyStyles =
    [ Css.position Css.absolute
    , Css.width (Css.px 1)
    , Css.height (Css.px 1)
    , Css.margin (Css.px -1)
    , Css.overflow Css.hidden
    , Css.padding Css.zero
    , Css.property "clip-path" "inset(50%)"
    , Css.property "white-space" "nowrap"
    , Css.border Css.zero
    ]


link : { target : LinkTarget, ariaCurrent : Maybe AriaCurrent, styles : List Css.Style, srOnlyLabel : Maybe String } -> Html msg -> Html msg
link config child =
    let
        ( href, targetAttrs, autoNotice ) =
            case config.target of
                Internal url ->
                    ( url, [], Nothing )

                External url ->
                    ( url
                    , [ Attributes.target "_blank"
                      , Attributes.rel "noopener noreferrer"
                      ]
                    , Just externalNoticeText
                    )

        ariaAttrs =
            case config.ariaCurrent of
                Just value ->
                    [ Attributes.attribute "aria-current" (ariaCurrentToString value) ]

                Nothing ->
                    []

        combinedTexts =
            case ( config.srOnlyLabel, autoNotice ) of
                ( Nothing, Nothing ) ->
                    []

                ( Just label, Nothing ) ->
                    [ label ]

                ( Nothing, Just notice ) ->
                    [ notice ]

                ( Just label, Just notice ) ->
                    [ label ++ ", " ++ notice ]

        screenReaderElement =
            if List.isEmpty combinedTexts then
                []

            else
                [ Html.span [ Attributes.css srOnlyStyles ]
                    [ " (" :: combinedTexts ++ [ ")" ] |> String.concat |> Html.text ]
                ]
    in
    Html.a
        ([ Attributes.href href
         , Attributes.css config.styles
         ]
            ++ targetAttrs
            ++ ariaAttrs
        )
        (child :: screenReaderElement)


navLink : String -> Bool -> List Css.Style -> Html msg -> Html msg
navLink url isActive styles =
    link
        { target = Internal url
        , ariaCurrent =
            if isActive then
                Just Page

            else
                Nothing
        , styles = styles
        , srOnlyLabel = Nothing
        }


externalLink : String -> List Css.Style -> Html msg -> Html msg
externalLink url styles =
    link
        { target = External url
        , ariaCurrent = Nothing
        , styles = styles
        , srOnlyLabel = Nothing
        }


externalLinkWithLabel : String -> String -> List Css.Style -> Html msg -> Html msg
externalLinkWithLabel url label styles =
    link
        { target = External url
        , ariaCurrent = Nothing
        , styles = styles
        , srOnlyLabel = Just label
        }
