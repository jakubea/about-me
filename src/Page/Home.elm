module Page.Home exposing (view)

import Atom.Heading as Heading
import Atom.Text as Text
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import I18n
import Taco exposing (Taco)
import Theme
import Util.Css as CssUtil
import Util.Layout as Layout


translateFn : I18n.Translators -> String -> String
translateFn translators =
    I18n.translateFn translators "Page.Home."


view : Taco -> Html msg
view taco =
    let
        translators =
            Taco.getTranslators taco
    in
    Layout.flexRow [ Layout.flexWrapWrap, CssUtil.widthPct 100, Layout.alignItemsCenter, Layout.justifyContentCenter, CssUtil.gapPx 20 ]
        [ Layout.flexColumn
            [ Layout.alignItemsCenter
            , CssUtil.gapPx 10
            , CssUtil.maxWidth 620
            ]
            [ translateFn translators "name" |> Heading.h1
            , translateFn translators "title" |> Text.view [ Text.red, Text.bold, Text.large ]
            , List.map (translateFn translators >> Text.view [ Text.grayLight, Text.center ])
                [ "experience", "focus", "thinking", "freeTime" ]
                |> Layout.flexColumn [ Layout.alignItemsCenter, CssUtil.gapPx 10 ]
            ]
        , Layout.flexColumn
            [ CssUtil.widthPct 50
            , CssUtil.widthPx 360
            , CssUtil.heightPx 360
            , CssUtil.property "aspect-ratio" "1 / 1"
            , CssUtil.borderRadiusPct 50
            , CssUtil.overflowHidden
            , Layout.positionRelative
            , CssUtil.backgroundColor Theme.color.primary
            ]
            [ Html.img
                [ Attributes.src "/me.jpg"
                , translateFn translators "profilePhotoAlt" |> Attributes.alt
                , Attributes.css
                    [ Layout.positionAbsolute
                    , CssUtil.topPx 0
                    , CssUtil.leftPx 0
                    , CssUtil.widthPct 100
                    , CssUtil.heightPct 100
                    , CssUtil.property "object-fit" "cover"
                    , CssUtil.property "object-position" "top"
                    , CssUtil.shadowMd
                    ]
                ]
                []
            ]
        ]
