module Page.Home exposing (view)

import Atom.Heading as Heading
import Atom.Icon as Icon
import Atom.Text as Text
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Theme
import Types exposing (CvData)
import Util.Css as CssUtil


view : CvData -> Html msg
view _ =
    Html.div
        [ Attributes.css
            [ CssUtil.backgroundColor Theme.color.background
            , Css.minHeight (Css.vh 100)
            ]
        ]
        [--  Html.section
         -- [ Attributes.css
         --     [ CssUtil.container
         --     , CssUtil.roundedLg
         --     , CssUtil.shadowMd
         --     , CssUtil.backgroundColor Theme.color.surface
         --     , Css.marginTop (Css.px 40)
         --     , Css.marginBottom (Css.px 40)
         --     , Css.padding (Css.px 32)
         --     ]
         -- ]
         -- [ Html.h1
         --     [ Attributes.css
         --         [ Css.fontSize (Css.px 48)
         --         , Css.fontWeight (Css.int 900)
         --         , CssUtil.color Theme.color.text
         --         , Css.marginBottom (Css.px 8)
         --         ]
         --     ]
         --     [ Html.text "PROGRAMMER" ]
         -- , Html.hr
         --     [ Attributes.css
         --         [ CssUtil.backgroundColor Theme.color.accent
         --         , Css.height (Css.px 4)
         --         , Css.width (Css.px 80)
         --         , Css.marginBottom (Css.px 24)
         --         , CssUtil.borderStyleNone
         --         ]
         --     ]
         --     []
         -- , Html.div
         --     [ Attributes.css [ CssUtil.flex, CssUtil.gap 24, CssUtil.marginBottom 32 ] ]
         --     [ Html.div [] [ Html.text "France" ]
         --     , Html.div [] [ Html.text "USA" ]
         --     , Html.div [] [ Html.text "German" ]
         --     ]
         -- , Html.h2
         --     [ Attributes.css
         --         [ Css.fontSize (Css.px 32)
         --         , Css.fontWeight (Css.int 700)
         --         , CssUtil.color Theme.color.text
         --         , Css.marginBottom (Css.px 8)
         --         ]
         --     ]
         --     [ Html.text "About Me" ]
         -- , Html.hr
         --     [ Attributes.css
         --         [ CssUtil.backgroundColor Theme.color.accent
         --         , Css.height (Css.px 2)
         --         , Css.width (Css.px 48)
         --         , Css.marginBottom (Css.px 24)
         --         , CssUtil.borderStyleNone
         --         ]
         --     ]
         --     []
         -- , Html.p
         --     [ Attributes.css
         --         [ CssUtil.color Theme.color.textLight
         --         , Css.fontSize (Css.px 18)
         --         , Css.marginBottom (Css.px 32)
         --         ]
         --     ]
         --     [ Html.text "I am a website designer from Louisiana, with a strong focus in UI/UX design. I love to get new experiences and always learn from my surroundings. I've done more than 285 projects. You can check it through portfolio section on this website. I looking forward to any opportunities and challenges." ]
         -- , Html.div
         --     [ Attributes.css [ CssUtil.flex, CssUtil.gap 32, CssUtil.justifyCenter, CssUtil.marginBottom 40 ] ]
         --     [ Html.div
         --         [ Attributes.css [ CssUtil.flexColumn, CssUtil.itemsCenter ] ]
         --         [ Html.div
         --             [ Attributes.css
         --                 [ Css.width (Css.px 120)
         --                 , Css.height (Css.px 120)
         --                 , CssUtil.roundedFull
         --                 , CssUtil.backgroundColor Theme.color.background
         --                 , Css.border3 (Css.px 4) Css.solid Theme.color.accent
         --                 , CssUtil.flex
         --                 , CssUtil.justifyCenter
         --                 , CssUtil.itemsCenter
         --                 ]
         --             ]
         --             [ Html.text "48.1%" ]
         --         , Html.p [ Attributes.css [ CssUtil.color Theme.color.accent, Css.fontWeight (Css.int 700), Css.marginTop (Css.px 8) ] ] [ Html.text "HTML" ]
         --         ]
         --     , Html.div
         --         [ Attributes.css [ CssUtil.flexColumn, CssUtil.itemsCenter ] ]
         --         [ Html.div
         --             [ Attributes.css
         --                 [ Css.width (Css.px 120)
         --                 , Css.height (Css.px 120)
         --                 , CssUtil.roundedFull
         --                 , CssUtil.backgroundColor Theme.color.background
         --                 , Css.border3 (Css.px 4) Css.solid Theme.color.accent
         --                 , CssUtil.flex
         --                 , CssUtil.justifyCenter
         --                 , CssUtil.itemsCenter
         --                 ]
         --             ]
         --             [ Html.text "45.2%" ]
         --         , Html.p [ Attributes.css [ CssUtil.color Theme.color.accent, Css.fontWeight (Css.int 700), Css.marginTop (Css.px 8) ] ] [ Html.text "CSS5" ]
         --         ]
         --     , Html.div
         --         [ Attributes.css [ CssUtil.flexColumn, CssUtil.itemsCenter ] ]
         --         [ Html.div
         --             [ Attributes.css
         --                 [ Css.width (Css.px 120)
         --                 , Css.height (Css.px 120)
         --                 , CssUtil.roundedFull
         --                 , CssUtil.backgroundColor Theme.color.background
         --                 , Css.border3 (Css.px 4) Css.solid Theme.color.accent
         --                 , CssUtil.flex
         --                 , CssUtil.justifyCenter
         --                 , CssUtil.itemsCenter
         --                 ]
         --             ]
         --             [ Html.text "42.5%" ]
         --         , Html.p [ Attributes.css [ CssUtil.color Theme.color.accent, Css.fontWeight (Css.int 700), Css.marginTop (Css.px 8) ] ] [ Html.text "PHP" ]
         --         ]
         --     , Html.div
         --         [ Attributes.css [ CssUtil.flexColumn, CssUtil.itemsCenter ] ]
         --         [ Html.div
         --             [ Attributes.css
         --                 [ Css.width (Css.px 120)
         --                 , Css.height (Css.px 120)
         --                 , CssUtil.roundedFull
         --                 , CssUtil.backgroundColor Theme.color.background
         --                 , Css.border3 (Css.px 4) Css.solid Theme.color.accent
         --                 , CssUtil.flex
         --                 , CssUtil.justifyCenter
         --                 , CssUtil.itemsCenter
         --                 ]
         --             ]
         --             [ Html.text "39.9%" ]
         --         , Html.p [ Attributes.css [ CssUtil.color Theme.color.accent, Css.fontWeight (Css.int 700), Css.marginTop (Css.px 8) ] ] [ Html.text "jQuery" ]
         --         ]
         --     ]
         -- , Html.section
         --     [ Attributes.css
         --         [ CssUtil.backgroundColor Theme.color.background
         --         , CssUtil.roundedLg
         --         , CssUtil.shadowMd
         --         , Css.padding (Css.px 32)
         --         , Css.marginTop (Css.px 40)
         --         ]
         --     ]
         --     [ Html.div
         --         [ Attributes.css [ CssUtil.flex, CssUtil.itemsCenter, CssUtil.gap 16 ] ]
         --         [ Html.span
         --             [ Attributes.css [ Css.fontSize (Css.px 48), CssUtil.color Theme.color.accent, Css.fontWeight (Css.int 900) ] ]
         --             [ Html.text "“" ]
         --         , Html.p
         --             [ Attributes.css [ CssUtil.color Theme.color.text, Css.fontSize (Css.px 20), Css.fontWeight (Css.int 600) ] ]
         --             [ Html.text "Do more than is required. What is the distance between someone who achieves their goals consistently and those who spend their lives and careers merely following? The extra mile." ]
         --         ]
         --     , Html.p
         --         [ Attributes.css [ CssUtil.color Theme.color.textLight, Css.fontSize (Css.px 16), Css.marginTop (Css.px 16) ] ]
         --         [ Html.text "Kyros Noriaki" ]
         --     ]
         -- ]
        ]
