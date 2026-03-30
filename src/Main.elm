module Main exposing (main)

import Browser
import Browser.Navigation exposing (Key)
import Css.Global
import Data.CvData exposing (cvData)
import Html.Styled as Html
import Html.Styled.Attributes as Attributes
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
import Theme
import Types exposing (CvData)
import Url
import Util.Css as CssUtil
import Util.Layout as Layout


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }


type alias Model =
    { route : Route
    , key : Key
    , cvData : CvData
    }


init : () -> Url.Url -> Key -> ( Model, Cmd Msg )
init _ url key =
    let
        route =
            Route.fromUrl url
    in
    ( { route = route
      , key = key
      , cvData = cvData
      }
    , Cmd.none
    )


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Browser.Navigation.pushUrl model.key (Url.toString url)
                    )

                Browser.External href ->
                    ( model
                    , Browser.Navigation.load href
                    )

        UrlChanged url ->
            ( { model | route = Route.fromUrl url }
            , Cmd.none
            )


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
                ]
            , Css.Global.selector "a:focus, button:focus"
                [ CssUtil.outline3 2 Theme.color.accent
                , CssUtil.outlineOffsetPx 2
                ]
            , Css.Global.selector "img, video, canvas, svg"
                [ CssUtil.maxWidthPct 100
                , CssUtil.heightAuto
                , Layout.displayBlock
                ]
            ]
        ]


pageView : Model -> Html.Html Msg
pageView model =
    Layout.flexColumn [ CssUtil.minHeightVh 100 ]
        [ Navigation.view model.route
        , let
            content =
                case model.route of
                    Route.Home ->
                        Home.view model.cvData

                    Route.Experience ->
                        ExperiencePage.view model.cvData

                    Route.Projects ->
                        ProjectsPage.view model.cvData

                    Route.Skills ->
                        SkillsPage.view model.cvData

                    Route.Languages ->
                        LanguagesPage.view model.cvData

                    Route.Elm ->
                        ElmPage.view

                    Route.NotFound ->
                        NotFoundPage.view
          in
          Html.main_
            [ Attributes.css
                [ CssUtil.backgroundColor Theme.color.primary
                , CssUtil.padding 20
                , Layout.displayFlex
                , Layout.flexInt 1
                , Layout.justifyContentCenter
                ]
            ]
            [ Layout.spacing [ CssUtil.maxWidth 1000 ] content ]
        , Footer.view model.cvData
        ]


view : Model -> Browser.Document Msg
view model =
    { title = "About Bea"
    , body =
        [ globalStyles |> Html.toUnstyled
        , pageView model |> Html.toUnstyled
        ]
    }
