module ReviewConfig exposing (config)


import NoBooleanCase
import NoDebug.Log
import NoDebug.TodoOrToString
import NoExposingEverything
import NoImportingEverything
import NoInconsistentAliases
import NoMissingTypeAnnotation
import NoMissingTypeConstructor
import NoModuleOnExposedNames
import NoPrematureLetComputation
import NoRecursiveUpdate
import NoSimpleLetBody
import NoUnused.CustomTypeConstructorArgs
import NoUnused.Dependencies
import NoUnused.Exports
import NoUnused.Modules
import NoUnused.Parameters
import NoUnused.Patterns
import NoUnused.Variables
import Review.Rule as Rule exposing (Rule)
import Simplify


config : List Rule
config =
    [ NoDebug.Log.rule
    , NoDebug.TodoOrToString.rule
        |> Rule.ignoreErrorsForDirectories [ "tests/" ]
    , NoExposingEverything.rule
    , NoImportingEverything.rule []
    , NoMissingTypeAnnotation.rule
    , NoSimpleLetBody.rule
    , NoPrematureLetComputation.rule
    , NoUnused.CustomTypeConstructorArgs.rule
    , NoUnused.Dependencies.rule
    , NoUnused.Exports.rule
    , NoUnused.Modules.rule
    , NoUnused.Parameters.rule
    , NoUnused.Patterns.rule
    , NoUnused.Variables.rule
    , NoRecursiveUpdate.rule
    , NoInconsistentAliases.config
        [ ( "Util.Css", "CssUtil" )
        , ( "Util.CustomWebData", "CustomWebData" )
        , ( "Util.ElementId", "ElementId" )
        , ( "Json.Encode", "Encode" )
        , ( "Json.Decode", "Decode" )
        ]
        |> NoInconsistentAliases.noMissingAliases
        |> NoInconsistentAliases.rule
    , NoModuleOnExposedNames.rule
    , NoBooleanCase.rule
    , Simplify.rule Simplify.defaults
    , NoMissingTypeConstructor.rule
    ]
