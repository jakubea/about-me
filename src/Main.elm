module Main exposing (main)

import Browser
import Browser.Navigation exposing (Key)
import Css
import Css.Global
import Data.CvData exposing (cvData)
import Html.Styled as Html
import Html.Styled.Attributes as Attributes
import Organism.Footer as Footer
import Organism.Header as Header
import Organism.Navigation as Navigation
import Page.Elm as ElmPage
import Page.Experience as ExperiencePage
import Page.Languages as LanguagesPage
import Page.NotFound as NotFoundPage
import Page.Projects as ProjectsPage
import Page.Skills as SkillsPage
import Route exposing (Route)
import Theme
import Types exposing (CvData)
import Url
import Util.Css as CssUtil


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



---- MODEL ----


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



---- UPDATE ----


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



---- VIEW ----


globalStyles : Html.Html msg
globalStyles =
    Html.div []
        [ Css.Global.global
            [ Css.Global.body
                [ CssUtil.backgroundColor Theme.color.background
                , CssUtil.color Theme.color.text
                , CssUtil.marginZero
                , CssUtil.paddingZero
                , Css.fontFamilies [ "-apple-system", "BlinkMacSystemFont", "Segoe UI", "Roboto", "sans-serif" ]
                , Css.lineHeight (Css.num 1.6)
                , CssUtil.property "-webkit-font-smoothing" "antialiased"
                ]
            , Css.Global.h1 [ CssUtil.marginZero ]
            , Css.Global.h2 [ CssUtil.marginZero ]
            , Css.Global.h3 [ CssUtil.marginZero ]
            , Css.Global.p [ CssUtil.marginZero ]
            , Css.Global.a [ CssUtil.cursorPointer ]
            ]
        ]


pageView : Model -> Html.Html Msg
pageView model =
    Html.div
        [ Attributes.css
            [ CssUtil.flexColumn
            , Css.minHeight (Css.vh 100)
            ]
        ]
        [ Navigation.view model.route
        , let
            content =
                case model.route of
                    Route.Home ->
                        Header.view model.cvData

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
                [ Css.flex (Css.num 1)
                , CssUtil.backgroundColor Theme.color.primary
                , CssUtil.minHeight 400
                , CssUtil.justifyContentCenter
                , CssUtil.displayFlex
                , CssUtil.fontFamilies [ "-apple-system", "BlinkMacSystemFont", "Segoe UI", "Roboto", "Inter", "system-ui", "sans-serif" ]
                , Css.boxSizing Css.borderBox
                ]
            ]
            [ content ]
        , Footer.view model.cvData
        ]


view : Model -> Browser.Document Msg
view model =
    { title = "CV - Your Name"
    , body =
        [ globalStyles |> Html.toUnstyled
        , pageView model |> Html.toUnstyled
        ]
    }
