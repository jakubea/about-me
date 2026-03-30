module ExampleTests exposing (suite)

import Expect
import Route exposing (Route(..))
import Test
import Url


suite : Test.Test
suite =
    Test.describe "Route"
        [ Test.test "parses the home route" <|
            \_ ->
                "/"
                    |> parseRoute
                    |> Expect.equal Home
        , Test.test "returns NotFound for an unknown route" <|
            \_ ->
                "/does-not-exist"
                    |> parseRoute
                    |> Expect.equal NotFound
        , Test.test "known routes round-trip through toPath and fromUrl" <|
            \_ ->
                [ Home, Experience, Projects, Skills, Languages, Elm ]
                    |> List.map (Route.toPath >> parseRoute)
                    |> Expect.equal [ Home, Experience, Projects, Skills, Languages, Elm ]
        ]


parseRoute : String -> Route
parseRoute path =
    ("https://example.com" ++ path)
        |> Url.fromString
        |> Maybe.map Route.fromUrl
        |> Maybe.withDefault NotFound
