module Data.CvData exposing (cvData)

import Types exposing (CvData)


cvData : CvData
cvData =
    { name = "Bea Jakubcova"
    , title = "Senior Frontend Engineer (Elm / Functional Programming)"
    , summary =
        [ "I’ve been working with Elm in production for 9 years, mostly building web applications in the financial domain."
        , "My background also includes digital production and SEO from my previous role at GroupM, where I worked on SEO analysis, link building, and Google Analytics reporting alongside the wider production work."
        , "For over 6 years, I’ve been the sole frontend developer on an application, taking care of everything from architecture and development to releases, deployments, and technical planning."
        , "I care about writing code that is easy to understand, test, and change. I’ve worked on large applications and handled frontend work all the way into production."
        , "Elm has shaped how I think about software — favouring simplicity, quality, reliability, strong types, and making invalid states impossible. I’m always curious and enjoy learning new things, including other functional programming languages."
        , "Outside of work, I’m a passionate traveller ✈️, nature lover 🌳, gym enthusiast 💪, and beer gourmet 🍺."
        ]
    , profileImage = "/me.jpg"
    , experiences =
        [ { company = "CN group / Ciklum"
          , position = "Elm developer"
          , startDate = "2017"
          , endDate = "2026"
          , description =
                [ "8+ years in FinTech, working on customer-facing apps, payment gateways, and internal banking tools."
                , "Building and maintaining Elm frontends and working on the architecture behind them."
                , "Designing solutions and working with UI/UX to make sure features work well for users."
                , "Mentoring colleagues and briefly leading a small frontend team."
                , "Breaking requirements down into technical tasks and managing the backlog."
                , "Handling releases and deployments and making sure changes get safely to production."
                ]
          , technologies =
                [ "Elm"
                , "elm-css"
                , "HTML5"
                , "pnpm"
                , "Vite"
                , "REST APIs"
                , "OAuth 2.0 (PKCE)"
                , "i18n (Localazy)"
                , "elm-test"
                , "Frontend Architecture"
                , "Technical Design"
                , "Frontend Lead"
                , "Task Management"
                , "Release & Deployment"
                , "Payment Gateways"
                , "Internal Banking Tools"
                ]
          }
        , { company = "Enerfis"
          , position = "Front-end developer"
          , startDate = "2016"
          , endDate = "2017"
          , description =
                [ "Building user interfaces and dashboards for energy management systems with Elm and CSS."
                , "Adding new features and fixing bugs in the Elm codebase."
                , "Getting my first hands-on experience with functional programming in production."
                ]
          , technologies =
                [ "Elm"
                , "HTML5"
                , "SASS"
                , "CSS3"
                , "Git"
                , "UI Development"
                , "Front-end Maintenance"
                ]
          }
        , { company = "GroupM"
          , position = "Digital Account Manager"
          , startDate = "2011"
          , endDate = "2018"
          , description =
                [ "Managing digital campaigns, microsites, banners, website updates, and email marketing."
                , "Creating graphics, editing videos, and producing content for digital campaigns."
                , "Working on SEO, link building, and improving organic search visibility."
                , "Working directly with clients and preparing campaign analytics and reports."
                , "Taking care of day-to-day maintenance and updates of digital assets."
                ]
          , technologies =
                [ "Digital Production"
                , "HTML"
                , "CSS"
                , "Email Marketing"
                , "Web Optimization"
                , "SEO"
                , "Linkbuilding"
                , "Graphic Design"
                , "Video Editing"
                , "Web Analytics"
                , "Performance Reporting"
                , "Client Communication"
                ]
          }
        ]
    , projects =
        { description =
            "Most of my work over the past 9 years has been on production client applications, so I can’t share that code publicly. There’s a lot of it, though.\n\nWhat you see here is a small selection of personal apps, experiments, and meetup projects.\n\nThe best way to see my work is in practice 😊"
        , githubProjects =
            [ { name = "about-me (this app)"
              , description =
                    "This is the portfolio you’re looking at. It’s built in Elm and contains my CV, projects, and some of the things I’ve worked with."
              , technologies =
                    [ "Elm 0.19.1"
                    , "elm-css"
                    , "Browser Navigation"
                    , "MVU Architecture"
                    , "Responsive Design"
                    ]
              , highlights =
                    [ "Elm project with a modular component structure"
                    , "Routing between the different sections"
                    , "Styling with elm-css"
                    , "Responsive layout"
                    ]
              , link = Just "https://github.com/jakubea/about-me"
              , liveLink = Just "https://about-bea.com/"
              }
            , { name = "Pay-De-Bill (in progress)"
              , description =
                    "A small app I’m building with my brother for splitting expenses and keeping track of who owes what."
              , technologies =
                    [ "Elm 0.19.2"
                    , "Vite"
                    , "REST APIs"
                    , "Mobile UI"
                    , "Frontend Architecture"
                    , "State Management"
                    , "Google Authentication"
                    , "PWA"
                    ]
              , highlights =
                    [ "Elm frontend for a Splitwise-style app"
                    , "Group expenses, balances, and settlements"
                    , "Google authentication"
                    , "Mobile-friendly UI and PWA"
                    , "Live and deployed"
                    ]
              , link = Just "https://github.com/pay-de-bill/frontend"
              , liveLink = Just "https://pay-de-bill.com/"
              }
            , { name = "elmivity (in progress)"
              , description =
                    "A game I’m building as an experiment with Elm and F#. It’s still a work in progress."
              , technologies =
                    [ "Elm 0.19.1"
                    , "F#"
                    , "MVU Architecture"
                    , "Elm-F# Interop"
                    , "Game Logic"
                    ]
              , highlights =
                    [ "Elm frontend with F# backend"
                    , "Game logic and state management in Elm"
                    , "Experimenting with Elm and F# together"
                    , "Still under development"
                    ]
              , link = Just "https://github.com/jakubea/elmivity"
              , liveLink = Nothing
              }
            , { name = "Elm Form Examples"
              , description =
                    "A collection of Elm form experiments I built while playing around with dynamic fields, validation, and reusable form components."
              , technologies =
                    [ "Elm 0.19.1"
                    , "elm-css"
                    , "Custom Form Components"
                    , "Dynamic Fields"
                    , "Validation"
                    , "Reusable Components"
                    ]
              , highlights =
                    [ "Dynamic fields and tags"
                    , "Validation"
                    , "Reusable form components"
                    , "Focus management"
                    ]
              , link = Just "https://github.com/jakubea/elm-tags-form"
              , liveLink = Nothing
              }
            ]
        }
    , skills =
        [ { category = "Languages"
          , items =
                [ "Elm"
                , "JavaScript"
                , "HTML5"
                , "CSS3"
                , "SASS"
                , "F# (basics)"
                , "SwiftUI (basics)"
                ]
          }
        , { category = "Architecture & Patterns"
          , items =
                [ "Elm Architecture (MVU)"
                , "Type-driven development"
                , "State machines"
                , "Component-based architecture"
                , "Client-side routing"
                ]
          }
        , { category = "Frontend Tools"
          , items =
                [ "SPA (Single Page Applications)"
                , "elm-css"
                , "elm-review"
                , "elm-test"
                , "Vite"
                , "i18n"
                , "elm-ui"
                , "Webpack"
                , "Tailwind"
                , "Browser DevTools"
                , "Performance profiling"
                , "Network inspection"
                ]
          }
        , { category = "CI/CD & Ops"
          , items =
                [ "CI/CD workflows"
                , "Code review"
                , "Release & Deployment"
                , "pnpm"
                , "Git"
                , "Azure DevOps"
                , "GitHub"
                , "Netlify"
                ]
          }
        , { category = "Domain & Systems"
          , items =
                [ "FinTech"
                , "Payment processing"
                , "Financial calculations"
                , "Role-based access control"
                , "Complex form workflows"
                , "Data visualization"
                ]
          }
        , { category = "Product & Creative"
          , items =
                [ "Technical Design"
                , "Figma"
                , "Task Management (Jira/Trello)"
                , "Adobe Photoshop"
                , "Adobe Premiere Pro"
                , "SEO"
                , "Canva"
                , "Digital Production"
                ]
          }
        ]
    , languages =
        [ { name = "Slovak", percent = 100 }
        , { name = "Czech", percent = 95 }
        , { name = "English", percent = 90 }
        , { name = "Spanish (in progress)", percent = 35 }
        , { name = "French", percent = 15 }
        ]
    , contact =
        { email = "jakubea@gmail.com"
        , location = "Prague, Czech Republic"
        , links =
            [ { label = "GitHub", url = "https://github.com/jakubea" }
            , { label = "LinkedIn", url = "https://www.linkedin.com/in/bea-jakubcova-3704ba6a/" }
            ]
        }
    , elmTopics =
        [ "Elm Architecture"
        , "Modularization (Atomic Design)"
        , "Shared state (Taco)"
        , "RemoteData"
        , "CustomWebData"
        , "Error handling"
        , "Validation"
        , "Custom types"
        , "Extensible records"
        , "Routing"
        , "QR codes"
        , "Permission-based routing"
        , "JSON decoders/encoders"
        , "HTTP error mapping"
        , "Reusable UI components"
        , "Modal dialogs"
        , "Regex"
        , "Tabbed content"
        , "Loading spinners and placeholders"
        , "Centralized error display"
        , "Advanced tables"
        , "Tree data structures"
        , "Pagination"
        , "Advanced search and filtering"
        , "Copy to clipboard"
        , "Parsing bytes (OAuth, file handling)"
        , "File upload/download"
        , "Commands and subscriptions for effects"
        , "Ports (JS interop)"
        , "Subscriptions (time, navigation, events)"
        , "OAuth and token management"
        , "Bytes and binary data handling"
        , "Custom parsers"
        , "Fuzz testing (property-based tests)"
        , "Mock data for tests"
        , "Dict, AssocList, and other data structures"
        , "Date and time utilities"
        , "Checkbox state management"
        , "Custom select"
        , "Date picker"
        , "Date range picker"
        , "Custom elm-review rules"
        , "Accessibility (focus management, keyboard navigation)"
        , "Tooltips"
        , "Counters"
        , "Custom links and navigation helpers"
        , "Exposing and import aliasing"
        , "Multiple languages (I18Next, i18n)"
        , "Mocking and test helpers"
        , "Design systems"
        , "Internationalization"
        , "Theming (Theme.elm)"
        , "Unit tests"
        , "elm-test"
        , "elm-review"
        , "Performance optimizations (lazy views, efficient data)"
        , "Documentation and comments"
        , "Drag and drop"
        , "Zip lists"
        , "Editable data types"
        , "Destructuring"
        , "Query parameters"
        , "URL parsing"
        ]
    }
