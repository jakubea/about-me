module I18n exposing (Translations, Translators, decodeTranslations, initialTranslations, translateFn, translators)

import I18Next
import Json.Decode as Decode
import String.Extra


type alias Translators =
    { t : String -> String
    , tr : String -> TranslationReplacements -> String
    }


type alias TranslationReplacements =
    I18Next.Replacements


type alias Translations =
    I18Next.Translations


type alias ModulePath =
    String


translateFn : Translators -> ModulePath -> String -> String
translateFn { t } modulePath string =
    if String.isEmpty string then
        ""

    else
        String.Extra.decapitalize string |> (++) modulePath |> t


translators : Translations -> Translators
translators translations =
    let
        delims =
            I18Next.Curly
    in
    { t = I18Next.t translations
    , tr = I18Next.tr translations delims
    }


decodeTranslations : Decode.Decoder I18Next.Translations
decodeTranslations =
    I18Next.translationsDecoder


initialTranslations : Translations
initialTranslations =
    I18Next.initialTranslations
