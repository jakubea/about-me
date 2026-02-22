module Data.CvData exposing (cvData)

import Types exposing (..)


cvData : CvData
cvData =
    { name = "Bea Jakubcova"
    , title = "Elm Developer"
    , summary = """Passionate Elm developer with expertise in building type-safe, maintainable web applications. 
  Experienced in functional programming, state management, and creating elegant solutions to complex problems. 
  Strong focus on code quality, testing, and performance."""
    , profileImage = "/me.jpg"
    , experiences =
        [ { company = "CN group / Ciklum"
          , position = "Elm developer"
          , startDate = "2017"
          , endDate = "Present"
          , description = "Developing and maintaining robust and type-safe frontend applications using Elm, focusing on maintainability, performance, and user experience. Main focus on building scalable UI components, implementing business logic, and ensuring high code quality in a regulated fintech environment."
          , technologies = [ "Elm", "elm-css", "REST APIs", "OAuth 2.0 (PKCE)", "Vite", "elm-test", "i18n (Localazy)", "pnpm" ]
          }
        , { company = "Enerfis"
          , position = "Elm developer"
          , startDate = "2016"
          , endDate = "2017"
          , description = "Built responsive web applications with focus on user experience and code quality."
          , technologies = [ "Elm", "HTML5", "CSS3", "JavaScript", "Git" ]
          }
        ]
    , projects =
        [ { name = "Call Center Frontend"
          , description = "Complex financial software for managing orders, customers, and payments."
          , technologies = [ "Elm 0.19.1", "elm-css", "OAuth2", "REST APIs" ]
          , highlights =
                [ "Type-safe development ensuring fewer runtime errors"
                , "Advanced state management using the Elm Architecture"
                , "Comprehensive filtering and search capabilities"
                , "Real-time data updates and notifications"
                ]
          , link = Just "https://github.com/yourusername/project1"
          }
        , { name = "This CV App"
          , description = "A responsive CV application showcasing Elm development patterns."
          , technologies = [ "Elm 0.19.1", "elm-css", "Browser Navigation" ]
          , highlights =
                [ "Clean component architecture"
                , "Responsive design"
                , "Browser routing"
                , "Semantic HTML"
                ]
          , link = Just "https://github.com/yourusername/elm-cv-app"
          }
        ]
    , skills =
        [ --    { category = "Languages"
          --   , items = [ "Elm", "JavaScript", "HTML5", "CSS3", "SQL" ]
          --   }
          -- , { category = "Frontend"
          --   , items = [ "elm-css", "Browser Navigation", "REST APIs", "OAuth2", "Type-safe development" ]
          --   }
          -- , { category = "Architectural Patterns"
          --   , items = [ "The Elm Architecture (TEA)", "Component composition", "State management", "Routing" ]
          --   }
          -- , { category = "Tools & Practices"
          --   , items = [ "Git", "Code review", "Testing", "Performance optimization" ]
          --   }
          { category = "Languages"
          , items = [ "Elm", "JavaScript", "HTML5", "CSS3", "SQL" ]
          }
        , { category = "Frontend & APIs"
          , items = [ "elm-css", "Single Page Applications (SPA)", "REST APIs", "OAuth 2.0 (PKCE)", "JSON Decoders/Encoders", "Internationalization (i18n)" ]
          }
        , { category = "Architecture & Patterns"
          , items = [ "Model-View-Update (MVU)", "Type-driven development", "Component-based architecture (Atomic Design)", "State machines", "Client-side routing" ]
          }
        , { category = "Testing & Tooling"
          , items = [ "elm-test", "elm-review", "Vite", "pnpm", "Git", "Code review", "CI/CD workflows" ]
          }
        , { category = "Domain & Systems"
          , items = [ "Fintech systems", "Payment processing", "Financial calculations", "Role-based access control", "Complex form workflows" ]
          }
        ]
    , contact =
        { email = "jakubea@gmail.com"
        , phone = "+420 777 229 264"
        , location = "Prague, Czech republic"
        , links =
            [ { label = "GitHub", url = "https://github.com/jakubea" }
            , { label = "LinkedIn", url = "https://www.linkedin.com/in/bea-jakubcova-3704ba6a/" }
            ]
        }
    }
