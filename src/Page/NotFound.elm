module Page.NotFound exposing (view)

import Atom.Heading as Heading
import Atom.Link as Link
import Atom.Text as Text
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Util.Css as CssUtil


view : Html msg
view =
    Html.div
        [ Attributes.css
            [ CssUtil.padding Theme.spacing.lg
            , Css.maxWidth (Css.px 800)
            , Css.marginLeft Css.auto
            , Css.marginRight Css.auto
            , Css.textAlign Css.center
            ]
        ]
        [ Html.h1
            [ Attributes.css
                [ Css.fontSize (Css.px 64)
                , CssUtil.color Theme.color.primary
                , CssUtil.margin 0
                ]
            ]
            [ Html.text "404" ]
        , Heading.h2 "Page Not Found"
        , Text.view "The page you're looking for doesn't exist."
        , Html.div
            [ Attributes.css [ CssUtil.marginTop Theme.spacing.lg ] ]
            [ Link.view "← Back to Home" "/" ]
        ]
