module Taco exposing (Taco, closeLanguageMenu, getIsLanguageMenuOpen, getLanguage, getTranslators, init, linkClicked, openLanguageMenu, setLanguage, setTranslators)

import Browser
import Browser.Navigation exposing (Key)
import I18n
import Types exposing (Flags, LanguageCode)
import Url


type Taco
    = Taco
        { language : LanguageCode
        , translators : I18n.Translators
        , isLanguageMenuOpen : Bool
        }


init : Flags -> Taco
init { selectedLanguage, translations } =
    Taco
        { language = selectedLanguage
        , translators = I18n.translators translations
        , isLanguageMenuOpen = False
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
