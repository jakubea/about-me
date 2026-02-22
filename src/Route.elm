module Route exposing
    ( Route(..)
    , fromUrl
    , toPath
    )

import Url
import Url.Parser exposing (Parser, map, oneOf, s, top)


type Route
    = Home
    | Experience
    | Projects
    | Skills
    | NotFound


parser : Parser (Route -> a) a
parser =
    oneOf
        [ map Home top
        , map Experience (s "experience")
        , map Projects (s "projects")
        , map Skills (s "skills")
        ]


fromUrl : Url.Url -> Route
fromUrl url =
    Url.Parser.parse parser url
        |> Maybe.withDefault NotFound


toPath : Route -> String
toPath route =
    case route of
        Home ->
            "/"

        Experience ->
            "/experience"

        Projects ->
            "/projects"

        Skills ->
            "/skills"

        NotFound ->
            "/"
