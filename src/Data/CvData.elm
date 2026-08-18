module Data.CvData exposing (cvData)

import Types exposing (CvData)


cvData : CvData
cvData =
    { name = "Bea Jakubcova"
    , title = "Senior Frontend Engineer (Elm / Functional Programming)"
    , summary =
        [ "Passionate Elm developer with 9 years of production experience building type-safe, maintainable web applications — mainly in the financial domain. Experienced in functional programming, state management, and creating elegant solutions to complex problems."
        , "Strong focus on code quality, testing, and performance, with experience working on large-scale applications and handling real-world production deployments."
        , "Elm has shaped how I think about software — favouring simplicity, strong types, and making invalid states impossible. I’m also always curious and open to learning new things."
        , "Outside of work, I’m a passionate traveller ✈️, nature lover 🌳, gym enthusiast 💪, and beer gourmet 🍺."
        ]
    , profileImage = "/me.jpg"
    , experiences =
        [ { company = "CN group / Ciklum"
          , position = "Elm developer"
          , startDate = "2017"
          , endDate = "Present"
          , description =
                [ "8+ years in FinTech: Developing customer apps, payment gateways, and internal banking tools."
                , "Technical Focus: Building reliable frontends using Elm."
                , "Technical Design: Designing solutions and contributing to UI/UX to ensure features make sense for the user."
                , "Team Support: Experienced in mentoring colleagues and briefly leading a small frontend team."
                , "Task Management: Breaking down requirements into technical tasks and managing the backlog."
                , "Release & Deploy: Owning the deployment process and ensuring code reaches production safely."
                ]
          , technologies = [ "Elm", "elm-css", "HTML5", "pnpm", "Vite", "REST APIs", "OAuth 2.0 (PKCE)", "i18n (Localazy)", "elm-test", "Frontend Architecture", "Technical Design", "Frontend Lead", "Task Management", "Release & Deployment", "Payment Gateways", "Internal Banking Tools" ]
          }
        , { company = "Enerfis"
          , position = "Front-end developer"
          , startDate = "2016"
          , endDate = "2017"
          , description =
                [ "Elm & CSS: Developing user interfaces and styling dashboards for energy management systems."
                , "Feature Development: Implementing new components and fixing bugs within the Elm codebase."
                , "Learning: Gaining hands-on experience with functional programming in a real-world production environment."
                ]
          , technologies = [ "Elm", "HTML5", "SASS", "CSS3", "Git", "UI Development", "Front-end Maintenance" ]
          }
        , { company = "GroupM"
          , position = "Digital Account Manager"
          , startDate = "2011"
          , endDate = "2018"
          , description =
                [ "Digital Production: Managing end-to-end campaigns, microsites, banners, website optimizations, and email marketing."
                , "Creative Tasks: Handling graphic design, video editing, and content creation for various digital projects."
                , "Marketing & SEO: Focused on SEO, linkbuilding, and improving organic search visibility."
                , "Client & Reporting: Direct communication with clients, focusing on campaign analytics and performance reports."
                , "Technical Support: Day-to-day operations and maintenance of digital assets."
                ]
          , technologies = [ "Digital Production", "HTML", "CSS", "Email Marketing", "Web Optimization", "SEO", "Linkbuilding", "Graphic Design", "Video Editing", "Web Analytics", "Performance Reporting", "Client Communication" ]
          }
        ]
    , projects =
        { description = "Most of my work over the past 9 years has been on production client applications, so I can’t share that code publicly — and there’s a lot of it.\nWhat you see here is a small selection of personal apps, experiments, and meetup projects.\nThe best way to see my work is in practice 😊"
        , githubProjects =
            [ { name = "about-me (this app)"
              , description = "A personal portfolio and CV web application built in Elm, demonstrating modular architecture, type safety, and clean UI."
              , technologies = [ "Elm 0.19.1", "elm-css", "Browser Navigation", "MVU Architecture", "Responsive Design" ]
              , highlights =
                    [ "Fully functional Elm project with a modular component structure (Atoms, Molecules, Pages)"
                    , "Includes routing and dynamic content display per section"
                    , "Uses type-safe styling with elm-css and responsive layout patterns"
                    , "Built to be well-structured, maintainable, and easy to extend"
                    ]
              , link = Just "https://github.com/jakubea/about-me"
              , liveLink = Just "https://about-bea.com/"
              }
            , { name = "Pay-De-Bill (in progress)"
              , description = "A shared-expense and bill-splitting app focused on group payments, balances, and settlement flows, with a clean and responsive user experience."
              , technologies = [ "Elm 0.19.2", "Vite", "REST APIs", "Mobile UI", "Frontend Architecture", "State Management", "Google Authentication", "PWA" ]
              , highlights =
                    [ "Built the frontend for a Splitwise-style app with room for more advanced finance features"
                    , "Focused on group expenses, balances, and transparent settlement flows"
                    , "Live app is deployed and available at pay-de-bill.com"
                    , "Designed with a careful, user-friendly financial UX"
                    ]
              , link = Just "https://github.com/pay-de-bill/frontend"
              , liveLink = Just "https://pay-de-bill.com/"
              }
            , { name = "elmivity (in progress)"
              , description = "An experimental game combining Elm frontend logic and F# backend concepts, showcasing MVU architecture and cross-language design. This project is still under development."
              , technologies = [ "Elm 0.19.1", "F#", "MVU Architecture", "Elm-F# Interop", "Game Logic" ]
              , highlights =
                    [ "Work in progress — core gameplay and features are still being developed"
                    , "Elm frontend integrated with F#-based backend logic"
                    , "Clear separation of state, view, and update logic following MVU"
                    , "Demonstrates type-safe cross-language development"
                    , "Runs locally with instructions in the README"
                    ]
              , link = Just "https://github.com/jakubea/elmivity"
              , liveLink = Nothing
              }
            , { name = "Elm Form Examples"
              , description = "A small collection of Elm form examples built from several personal experiments. It demonstrates type-safe validation, dynamic fields, reusable components, and user-friendly interactions."
              , technologies = [ "Elm 0.19.1", "elm-css", "Custom Form Components", "Dynamic Fields", "Validation", "Reusable Components" ]
              , highlights =
                    [ "Dynamic form fields with tags and focus management"
                    , "Type-safe validation for reliable user input"
                    , "Clean, reusable components for multiple form patterns"
                    , "Shows how Elm architecture can support interactive UI flows"
                    ]
              , link = Just "https://github.com/jakubea/elm-tags-form"
              , liveLink = Nothing
              }
            ]
        }
    , skills =
        [ { category = "Languages"
          , items = [ "Elm", "JavaScript", "HTML5", "CSS3", "SASS", "F# (basics)", "SwiftUI (basics)" ]
          }
        , { category = "Architecture & Patterns"
          , items = [ "Model-View-Update (MVU)", "Type-driven development", "State machines", "Component-based architecture (Atomic Design)", "Client-side routing" ]
          }
        , { category = "Frontend Tools"
          , items = [ "SPA (Single Page Applications)", "elm-css", "elm-review", "elm-test", "Vite", "i18n", "elm-ui", "Webpack", "Tailwind", "Browser DevTools", "Debugging with DevTools", "Performance profiling", "Network inspection" ]
          }
        , { category = "CI/CD & Ops"
          , items = [ "CI/CD workflows", "Code review", "Release & Deployment", "pnpm", "Git", "Azure DevOps", "GitHub", "Netlify" ]
          }
        , { category = "Domain & Systems"
          , items = [ "Fintech systems", "Payment processing", "Financial calculations", "Role-based access control", "Complex form workflows", "Data Visualization" ]
          }
        , { category = "Product & Creative"
          , items = [ "Technical Design", "Figma", "Task Management (Jira/Trello)", "Adobe Photoshop", "Adobe Premiere Pro", "SEO", "Canva", "Digital Production" ]
          }
        , { category = "Soft Skills"
          , items = [ "Attention to detail", "Team collaboration", "Client-facing communication", "Analytical thinking", "Mentoring & Knowledge sharing", "Quality-oriented mindset", "Ownership & Responsibility" ]
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
        , location = "Prague, Czech republic"
        , links =
            [ { label = "GitHub", url = "https://github.com/jakubea" }
            , { label = "LinkedIn", url = "https://www.linkedin.com/in/bea-jakubcova-3704ba6a/" }
            ]
        }
    , elmTopics =
        [ "Elm Architecture"
        , "Modularization (Atomic design)"
        , "Shared state (Taco)"
        , "RemoteData"
        , "CustomWebData"
        , "Error handling"
        , "Validation"
        , "Custom types"
        , "Extensible records"
        , "Routing"
        , "QR code"
        , "Permission-based routing"
        , "JSON Decoders/encoders"
        , "HTTP error mapping"
        , "Reusable UI components"
        , "Modal dialogs"
        , "Regex"
        , "Tabbed content"
        , "Loading spinners and placeholders"
        , "Centralized error display"
        , "Advanced table"
        , "Tree data structore"
        , "Pagination"
        , "Advanced search and filtering"
        , "Copy to clipboard utility"
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
        , "Extensive use of Dict, AssocList, and other data structures"
        , "Date and time utilities"
        , "Checkbox state management"
        , "Custom select"
        , "Date picker"
        , "Date range picker"
        , "Review rules (elm-review custom config)"
        , "Accessibility (focus management, keyboard navigation)"
        , "Tooltip"
        , "Counter"
        , "Custom link and navigation helpers"
        , "Extensive use of exposing and import aliasing"
        , "Multiple languages (I18Next, I18n)"
        , "Mocking and test helpers"
        , "Design system"
        , "i18n (internationalization)"
        , "Theming (Theme.elm)"
        , "Unit tests"
        , "elm-test"
        , "elm-review"
        , "Performance optimizations (lazy views, efficient data)"
        , "Documentation and comments"
        , "Drag n Drop"
        , "Zip list"
        , "Editable data type"
        , "Destructuring"
        , "Query params"
        , "Url parsing"
        ]
    }
