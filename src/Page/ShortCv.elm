module Page.ShortCv exposing (view)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Html.Styled.Events as Events
import I18n
import Theme
import Types exposing (CvData, Experience, Project, Skill)
import Util.Css as CssUtil
import Util.Layout as Layout


translateFn : I18n.Translators -> String -> String
translateFn translators =
    I18n.translateFn translators "Page.ShortCv."


pageTextColor : Css.Style
pageTextColor =
    CssUtil.property "color" "#111827"


mutedTextColor : Css.Style
mutedTextColor =
    CssUtil.property "color" "#4b5563"


paperBackground : Css.Style
paperBackground =
    CssUtil.property "background" "#ffffff"


canvasBackground : Css.Style
canvasBackground =
    CssUtil.property "background" "#f3f4f6"


borderColor : Css.Color
borderColor =
    Css.hex "e5e7eb"


sectionTitle : String -> Html msg
sectionTitle title =
    Html.h2
        [ Attributes.css
            [ pageTextColor
            , CssUtil.fontWeight 700
            , CssUtil.fontSize Theme.fontSize.lg
            , CssUtil.marginBottom 12
            ]
        ]
        [ Html.text title ]


paragraph : String -> Html msg
paragraph content =
    Html.p
        [ Attributes.css
            [ pageTextColor
            , CssUtil.marginBottom 10
            , CssUtil.lineHeight 1.5
            ]
        ]
        [ Html.text content ]


bulletList : List String -> Html msg
bulletList items =
    Html.ul
        [ Attributes.css
            [ pageTextColor
            , CssUtil.property "padding-left" "20px"
            , CssUtil.marginZero
            , CssUtil.property "display" "grid"
            , CssUtil.gapPx 8
            ]
        ]
        (List.map
            (\bullet ->
                Html.li
                    [ Attributes.css [ CssUtil.lineHeight 1.45 ] ]
                    [ Html.text bullet ]
            )
            items
        )


chip : String -> Html msg
chip label =
    Html.span
        [ Attributes.css
            [ CssUtil.property "display" "inline-flex"
            , CssUtil.property "background" "#fff1f1"
            , CssUtil.property "color" "#a61b1b"
            , CssUtil.property "border" "1px solid #ffd6d6"
            , CssUtil.borderRadius 999
            , CssUtil.padding2 4 10
            , CssUtil.fontSize Theme.fontSize.xs
            , CssUtil.fontWeight 600
            ]
        ]
        [ Html.text label ]


contactLink : String -> String -> Html msg
contactLink href label =
    Html.a
        [ Attributes.href href
        , Attributes.css
            [ pageTextColor
            , CssUtil.textDecorationNone
            , CssUtil.fontWeight 600
            ]
        ]
        [ Html.text label ]


metadataText : String -> Html msg
metadataText content =
    Html.span
        [ Attributes.css [ mutedTextColor, CssUtil.fontSize Theme.fontSize.sm ] ]
        [ Html.text content ]


experienceView : Experience -> Html msg
experienceView experience =
    Layout.flexColumn
        [ CssUtil.gapPx 10
        , CssUtil.paddingBottom 18
        , CssUtil.borderBottom borderColor 1
        ]
        [ Layout.flexRow
            [ Layout.justifyContentSpaceBetween
            , Layout.alignItemsFlexEnd
            , Layout.flexWrapWrap
            , CssUtil.gapPx 8
            ]
            [ Html.div []
                [ Html.h3
                    [ Attributes.css [ pageTextColor, CssUtil.fontWeight 700, CssUtil.fontSize Theme.fontSize.md ] ]
                    [ Html.text (experience.position ++ " - " ++ experience.company) ]
                ]
            , metadataText (experience.startDate ++ " - " ++ experience.endDate)
            ]
        , bulletList (List.take 2 experience.description)
        , Layout.flexRow [ Layout.flexWrapWrap, CssUtil.gapPx 8 ]
            (List.map chip (List.take 6 experience.technologies))
        ]


projectView : Project -> Html msg
projectView project =
    Layout.flexColumn
        [ CssUtil.gapPx 8
        , CssUtil.paddingBottom 16
        , CssUtil.borderBottom borderColor 1
        ]
        [ Html.h3
            [ Attributes.css [ pageTextColor, CssUtil.fontWeight 700, CssUtil.fontSize Theme.fontSize.md ] ]
            [ Html.text project.name ]
        , paragraph project.description
        , case project.link of
            Just url ->
                contactLink url url

            Nothing ->
                Html.text ""
        ]


skillGroupView : Skill -> Html msg
skillGroupView skill =
    Layout.flexColumn [ CssUtil.gapPx 6 ]
        [ Html.h3
            [ Attributes.css [ pageTextColor, CssUtil.fontWeight 700, CssUtil.fontSize Theme.fontSize.md ] ]
            [ Html.text skill.category ]
        , Html.p
            [ Attributes.css [ mutedTextColor, CssUtil.lineHeight 1.5, CssUtil.marginZero ] ]
            [ Html.text (String.join ", " (List.take 6 skill.items)) ]
        ]


languageView : { name : String, percent : Float } -> Html msg
languageView language =
    Layout.flexRow [ Layout.justifyContentSpaceBetween, CssUtil.gapPx 12 ]
        [ Html.span [ Attributes.css [ pageTextColor, CssUtil.fontWeight 600 ] ] [ Html.text language.name ]
        , metadataText (String.fromFloat language.percent ++ "%")
        ]


actionButton : msg -> String -> Html msg
actionButton msg label =
    Html.button
        [ Attributes.type_ "button"
        , Events.onClick msg
        , Attributes.css
            [ CssUtil.property "background" "#111827"
            , CssUtil.property "color" "#ffffff"
            , CssUtil.property "border" "none"
            , CssUtil.borderRadius 999
            , CssUtil.padding2 10 16
            , CssUtil.fontWeight 700
            , CssUtil.cursorPointer
            ]
        ]
        [ Html.text label ]


secondaryActionLink : String -> String -> Html msg
secondaryActionLink href label =
    Html.a
        [ Attributes.href href
        , Attributes.css
            [ CssUtil.property "background" "#ffffff"
            , pageTextColor
            , CssUtil.property "border" "1px solid #d1d5db"
            , CssUtil.borderRadius 999
            , CssUtil.padding2 10 16
            , CssUtil.fontWeight 700
            , CssUtil.textDecorationNone
            , CssUtil.property "display" "inline-flex"
            ]
        ]
        [ Html.text label ]


view : I18n.Translators -> msg -> CvData -> Html msg
view translators toPrint cvData =
    let
        selectedProjects =
            List.take 2 cvData.projects.githubProjects

        selectedSkills =
            List.take 4 cvData.skills

        contactItems =
            [ contactLink ("mailto:" ++ cvData.contact.email) cvData.contact.email
            , Html.span [ Attributes.css [ pageTextColor, CssUtil.fontWeight 600 ] ] [ Html.text cvData.contact.location ]
            ]
                ++ List.map (\record -> contactLink record.url record.label) cvData.contact.links
    in
    Html.section
        [ Attributes.css
            [ canvasBackground
            , CssUtil.widthPct 100
            , CssUtil.minHeightVh 100
            , CssUtil.padding 24
            ]
        ]
        [ Layout.flexColumn
            [ CssUtil.maxWidth 980
            , CssUtil.property "margin" "0 auto"
            , CssUtil.gapPx 18
            ]
            [ Html.div
                [ Attributes.attribute "data-print-hidden" "true"
                , Attributes.css
                    [ CssUtil.property "display" "flex"
                    , CssUtil.property "justify-content" "space-between"
                    , CssUtil.property "align-items" "center"
                    , CssUtil.property "gap" "12px"
                    , CssUtil.property "flex-wrap" "wrap"
                    ]
                ]
                [ Layout.flexColumn [ CssUtil.gapPx 4 ]
                    [ Html.span [ Attributes.css [ pageTextColor, CssUtil.fontWeight 700 ] ] [ Html.text (translateFn translators "title") ]
                    , Html.span [ Attributes.css [ mutedTextColor ] ] [ Html.text (translateFn translators "subtitle") ]
                    ]
                , Layout.flexRow [ CssUtil.gapPx 10, Layout.flexWrapWrap ]
                    [ actionButton toPrint (translateFn translators "printAction")
                    , secondaryActionLink "/" (translateFn translators "backAction")
                    ]
                ]
            , Html.article
                [ Attributes.css
                    [ paperBackground
                    , CssUtil.borderRadius 24
                    , CssUtil.property "box-shadow" "0 24px 60px rgba(15, 23, 42, 0.08)"
                    , CssUtil.padding 36
                    ]
                ]
                [ Layout.flexColumn [ CssUtil.gapPx 28 ]
                    [ Layout.flexColumn [ CssUtil.gapPx 12 ]
                        [ Html.h1
                            [ Attributes.css [ pageTextColor, CssUtil.fontWeight 800, CssUtil.fontSize Theme.fontSize.xxl ] ]
                            [ Html.text cvData.name ]
                        , Html.p
                            [ Attributes.css [ CssUtil.property "color" "#b91c1c", CssUtil.fontWeight 700, CssUtil.fontSize Theme.fontSize.lg, CssUtil.marginZero ] ]
                            [ Html.text cvData.title ]
                        , Layout.flexRow [ Layout.flexWrapWrap, CssUtil.gapPx 12 ] contactItems
                        , Html.div [] (List.map paragraph (List.take 2 cvData.summary))
                        ]
                    , Html.div
                        [ Attributes.css
                            [ Layout.displayGrid
                            , CssUtil.property "grid-template-columns" "minmax(0, 1.6fr) minmax(280px, 1fr)"
                            , CssUtil.gapPx 28
                            ]
                        ]
                        [ Layout.flexColumn [ CssUtil.gapPx 24 ]
                            [ Html.section []
                                [ sectionTitle (translateFn translators "experience")
                                , Layout.flexColumn [ CssUtil.gapPx 18 ] (List.map experienceView (List.take 2 cvData.experiences))
                                ]
                            , Html.section []
                                [ sectionTitle (translateFn translators "projects")
                                , Layout.flexColumn [ CssUtil.gapPx 16 ] (List.map projectView selectedProjects)
                                ]
                            ]
                        , Layout.flexColumn [ CssUtil.gapPx 24 ]
                            [ Html.section []
                                [ sectionTitle (translateFn translators "skills")
                                , Layout.flexColumn [ CssUtil.gapPx 16 ] (List.map skillGroupView selectedSkills)
                                ]
                            , Html.section []
                                [ sectionTitle (translateFn translators "languages")
                                , Layout.flexColumn [ CssUtil.gapPx 10 ] (List.map languageView cvData.languages)
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
