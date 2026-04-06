module Util.Parser exposing (languageCodeFromString, languageCodeToString)

import Types exposing (LanguageCode(..))


languageCodeFromString : String -> LanguageCode
languageCodeFromString string =
    case string of
        "en" ->
            En

        "es" ->
            Es

        "sk" ->
            Sk

        "cs" ->
            Cs

        _ ->
            En


languageCodeToString : LanguageCode -> String
languageCodeToString code =
    case code of
        En ->
            "En"

        Es ->
            "Es"

        Sk ->
            "Sk"

        Cs ->
            "Cs"
