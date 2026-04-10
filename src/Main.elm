port module Main exposing (main)

import Browser
import Browser.Navigation exposing (Key)
import Css.Global
import Data.CvData exposing (cvData)
import Html.Styled as Html
import Html.Styled.Attributes as Attributes
import Html.Styled.Keyed as Keyed
import I18n
import Json.Decode as Decode
import Json.Decode.Pipeline as Pipeline
import Json.Encode as Encode
import Organism.Footer as Footer
import Organism.Navigation as Navigation
import Page.Elm as ElmPage
import Page.Experience as ExperiencePage
import Page.Home as Home
import Page.Languages as LanguagesPage
import Page.NotFound as NotFoundPage
import Page.Projects as ProjectsPage
import Page.Skills as SkillsPage
import Route exposing (Route)
import Taco exposing (Taco)
import Task
import Theme
import Time
import Types exposing (Flags, LanguageCode(..))
import Url
import Util.Css as CssUtil
import Util.Layout as Layout
import Util.Motion as Motion
import Util.Parser as Parser


main : Program RawFlags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }


type Model
    = Loading Key Url.Url Flags
    | Ready Key Taco Route
    | Error String


type alias RawFlags =
    Encode.Value


init : RawFlags -> Url.Url -> Key -> ( Model, Cmd Msg )
init rawFlags url key =
    case Decode.decodeValue flagsDecoder rawFlags of
        Ok flagsDecoded ->
            let
                getCurrentZoneCmd =
                    Task.perform GotCurrentZone Time.here
            in
            ( Loading key url flagsDecoded
            , getCurrentZoneCmd
            )

        Err error ->
            ( Decode.errorToString error |> Error, Cmd.none )


flagsDecoder : Decode.Decoder Flags
flagsDecoder =
    Decode.succeed Flags
        |> Pipeline.optional "translations" I18n.decodeTranslations I18n.initialTranslations
        |> Pipeline.optional "selectedLanguage" (Decode.map Parser.languageCodeFromString Decode.string) En


type Msg
    = GotCurrentZone Time.Zone
    | GotTime Time.Posix
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | OpenLanguageMenu
    | CloseLanguageMenu
    | LanguageChanged LanguageCode
    | GotTranslations Decode.Value


port setLanguageStorage : String -> Cmd msg


port getTranslationsForLanguage : String -> Cmd msg


port gotTranslationsForLanguage : (Decode.Value -> msg) -> Sub msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case model of
        Loading key url flags ->
            case msg of
                GotCurrentZone newZone ->
                    let
                        route =
                            Route.fromUrl url

                        taco =
                            Taco.init newZone flags

                        getTimeCmd =
                            Task.perform GotTime Time.now
                    in
                    ( Ready key taco route, getTimeCmd )

                _ ->
                    ( model, Cmd.none )

        Ready key taco route ->
            case msg of
                GotTime time ->
                    let
                        updatedTaco =
                            Taco.setCurrentTime time taco
                    in
                    ( Ready key updatedTaco route, Cmd.none )

                UrlChanged url ->
                    ( Ready key (Taco.closeLanguageMenu taco) (Route.fromUrl url)
                    , Cmd.none
                    )

                LinkClicked urlRequest ->
                    let
                        ( nextTaco, cmd ) =
                            Taco.linkClicked urlRequest key taco
                    in
                    ( Ready key nextTaco route, cmd )

                OpenLanguageMenu ->
                    ( Ready key (Taco.openLanguageMenu taco) route, Cmd.none )

                CloseLanguageMenu ->
                    ( Ready key (Taco.closeLanguageMenu taco) route, Cmd.none )

                LanguageChanged language ->
                    if language == Taco.getLanguage taco then
                        ( Ready key (Taco.closeLanguageMenu taco) route, Cmd.none )

                    else
                        ( Ready key (taco |> Taco.setLanguage language |> Taco.closeLanguageMenu) route
                        , Cmd.batch
                            [ setLanguageStorage (Parser.languageCodeToString language)
                            , getTranslationsForLanguage (Parser.languageCodeToString language)
                            ]
                        )

                GotTranslations value ->
                    case Decode.decodeValue I18n.decodeTranslations value of
                        Ok translations ->
                            ( Ready key (Taco.setTranslators (I18n.translators translations) taco) route
                            , Cmd.none
                            )

                        Err error_ ->
                            ( Decode.errorToString error_ |> Error, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        Error _ ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    let
        hourMs =
            3600000
    in
    Sub.batch
        [ gotTranslationsForLanguage GotTranslations
        , Time.every hourMs GotTime
        ]


globalStyles : Html.Html msg
globalStyles =
    Html.div []
        [ Css.Global.global
            [ Css.Global.selector "*, *::before, *::after"
                [ CssUtil.boxSizingBorderBox ]
            , Css.Global.body
                [ CssUtil.marginZero
                , CssUtil.paddingZero
                , CssUtil.backgroundColor Theme.color.background
                , CssUtil.color Theme.color.text
                , CssUtil.fontFamilies [ "-apple-system", "BlinkMacSystemFont", "Segoe UI", "Roboto", "sans-serif" ]
                , CssUtil.lineHeight 1.6
                , CssUtil.property "-webkit-font-smoothing" "antialiased"
                , CssUtil.minHeightVh 100
                ]
            , Css.Global.selector "h1, h2, h3, p"
                [ CssUtil.marginZero ]
            , Css.Global.a
                [ CssUtil.color Theme.color.primary
                , CssUtil.textDecorationUnderline
                , CssUtil.property "text-decoration-thickness" "0.08em"
                , CssUtil.property "text-underline-offset" "0.16em"
                , CssUtil.transition [ "color", "text-decoration-color", "text-underline-offset" ]
                ]
            , Css.Global.selector "button"
                [ CssUtil.marginZero
                , CssUtil.paddingZero
                , CssUtil.colorInherit
                , CssUtil.lineHeight 1.6
                , CssUtil.property "background" "none"
                , CssUtil.property "border" "0"
                , CssUtil.property "appearance" "none"
                , CssUtil.property "-webkit-appearance" "none"
                , CssUtil.property "font" "inherit"
                ]
            , Css.Global.selector "a:focus, button:focus"
                [ CssUtil.outline3 1 Theme.color.accent
                , CssUtil.outlineOffsetPx 2
                ]
            , Css.Global.selector "img, video, canvas, svg"
                [ CssUtil.maxWidthPct 100
                , CssUtil.heightAuto
                , Layout.displayBlock
                ]
            ]
        ]


pageView : Taco -> Route -> Html.Html Msg
pageView taco route =
    let
        translators =
            Taco.getTranslators taco

        content =
            case route of
                Route.Home ->
                    Home.view taco

                Route.Experience ->
                    ExperiencePage.view translators cvData

                Route.Projects ->
                    ProjectsPage.view cvData

                Route.Skills ->
                    SkillsPage.view cvData

                Route.Languages ->
                    LanguagesPage.view cvData

                Route.Elm ->
                    ElmPage.view

                Route.NotFound ->
                    NotFoundPage.view
    in
    Layout.flexColumn [ CssUtil.minHeightVh 100 ]
        [ Navigation.view taco route (Taco.getIsLanguageMenuOpen taco) OpenLanguageMenu CloseLanguageMenu LanguageChanged
        , Html.main_
            [ Attributes.css
                [ CssUtil.backgroundColor Theme.color.primary
                , CssUtil.padding 20
                , Layout.displayFlex
                , Layout.flexInt 1
                , Layout.justifyContentCenter
                ]
            ]
            [ Keyed.node "div"
                []
                [ ( Route.toPath route
                  , Layout.flexColumn
                        (Motion.revealStyleWithEasing "cubic-bezier(0.2, 0.8, 0.2, 1)" "translate3d(0, -10px, 0)" 760 0
                            ++ [ CssUtil.maxWidth 1000
                               , CssUtil.widthPct 100
                               ]
                        )
                        [ content ]
                  )
                ]
            ]
        , Footer.view translators cvData
        ]


translateFn : I18n.Translators -> String -> String
translateFn translators =
    I18n.translateFn translators "Main."


view : Model -> Browser.Document Msg
view model =
    case model of
        Loading _ _ _ ->
            -- TODO: Add loading indicator
            { title = "loading"
            , body = []
            }

        Ready _ taco route ->
            { title = translateFn (Taco.getTranslators taco) "title"
            , body =
                [ globalStyles |> Html.toUnstyled
                , pageView taco route |> Html.toUnstyled
                ]
            }

        Error error ->
            { title = error
            , body = []
            }
