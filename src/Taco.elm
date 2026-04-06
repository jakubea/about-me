module Taco exposing (Taco, closeLanguageMenu, getCurrentTime, getIsLanguageMenuOpen, getLanguage, getTranslators, getZone, init, linkClicked, openLanguageMenu, setCurrentTime, setLanguage, setTranslators)

import Browser
import Browser.Navigation exposing (Key)
import I18n
import Time
import Types exposing (Flags, LanguageCode)
import Url


type Taco
    = Taco
        { language : LanguageCode
        , translators : I18n.Translators
        , isLanguageMenuOpen : Bool
        , zone : Time.Zone
        , currentTime : Time.Posix
        }


init : Time.Zone -> Flags -> Taco
init zone { selectedLanguage, translations } =
    Taco
        { language = selectedLanguage
        , translators = I18n.translators translations
        , isLanguageMenuOpen = False
        , zone = zone
        , currentTime = Time.millisToPosix 0
        }


getLanguage : Taco -> LanguageCode
getLanguage (Taco { language }) =
    language


getTranslators : Taco -> I18n.Translators
getTranslators (Taco { translators }) =
    translators


setLanguage : LanguageCode -> Taco -> Taco
setLanguage currentLanguage (Taco taco) =
    Taco { taco | language = currentLanguage }


setTranslators : I18n.Translators -> Taco -> Taco
setTranslators translators (Taco taco) =
    Taco { taco | translators = translators }


setCurrentTime : Time.Posix -> Taco -> Taco
setCurrentTime currentTime (Taco taco) =
    Taco { taco | currentTime = currentTime }


getCurrentTime : Taco -> Time.Posix
getCurrentTime (Taco { currentTime }) =
    currentTime


getZone : Taco -> Time.Zone
getZone (Taco { zone }) =
    zone


getIsLanguageMenuOpen : Taco -> Bool
getIsLanguageMenuOpen (Taco { isLanguageMenuOpen }) =
    isLanguageMenuOpen


openLanguageMenu : Taco -> Taco
openLanguageMenu (Taco taco) =
    Taco { taco | isLanguageMenuOpen = True }


closeLanguageMenu : Taco -> Taco
closeLanguageMenu (Taco taco) =
    Taco { taco | isLanguageMenuOpen = False }


linkClicked : Browser.UrlRequest -> Key -> Taco -> ( Taco, Cmd msg )
linkClicked urlRequest key taco =
    case urlRequest of
        Browser.Internal url ->
            ( closeLanguageMenu taco
            , Browser.Navigation.pushUrl key (Url.toString url)
            )

        Browser.External href ->
            ( closeLanguageMenu taco
            , Browser.Navigation.load href
            )
