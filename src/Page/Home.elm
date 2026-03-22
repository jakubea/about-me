module Page.Home exposing (view)

import Atom.Heading as Heading
import Atom.Layout as Layout
import Atom.Text as Text
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Types exposing (CvData)
import Util.Css as CssUtil


view : CvData -> Html msg
view { name, title, summary, profileImage } =
    Layout.flexRow [ Layout.flexWrapWrap, CssUtil.widthPct 100, Layout.justifyContentCenter, CssUtil.gapPx 20 ]
        [ Layout.flexColumn
            [ Layout.alignItemsCenter
            , CssUtil.gapPx 10
            , CssUtil.maxWidth 620
            ]
            [ Heading.h1 name
            , Text.view [ Text.red, Text.bold, Text.large ] title
            , List.map (Text.view [ Text.grayLight ]) summary
                |> Layout.flexColumn [ Layout.alignItemsCenter ]
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
                [ Attributes.src profileImage
                , Attributes.alt "Profile photo"
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
