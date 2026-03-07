module Data.CvData exposing (cvData)

import Types exposing (CvData)


cvData : CvData
cvData =
    { name = "Bea Jakubcova"
    , title = "Elm Developer"
    , summary =
        [ "Elm developer with 9 years of production experience."
        , "I love building type-safe, reliable web apps and solving complex problems with functional programming. Elm has shaped how I think about software — simplicity, strong types, and making invalid states impossible."
        , "I’m curious, enjoy learning new things, and like trying out new ideas."
        , "Outside of work, I’m a passionate traveller, gym enthusiast, and beer lover."
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
        [ { name = "Bank app"
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
        [ { category = "Languages"
          , items = [ "Elm", "JavaScript", "HTML5", "CSS3", "SASS", "F# (basics)" ]
          }
        , { category = "Architecture & Patterns"
          , items = [ "Model-View-Update (MVU)", "Type-driven development", "State machines", "Component-based architecture (Atomic Design)", "Client-side routing" ]
          }
        , { category = "Frontend Tools"
          , items = [ "SPA (Single Page Applications)", "elm-ui", "Tailwind", "elm-css", "elm-test", "elm-review", "i18n", "Vite", "Webpack" ]
          }
        , { category = "CI/CD & Ops"
          , items = [ "CI/CD workflows", "Code review", "Release & Deployment", "pnpm", "Git", "Azure DevOps", "GitHub", "Netlify" ]
          }
        , { category = "Domain & Systems"
          , items = [ "Fintech systems", "Payment processing", "Financial calculations", "Role-based access control", "Complex form workflows", "Data Visualization" ]
          }
        , { category = "Product & Creative"
          , items = [ "Technical Design", "Task Management (Jira/Trello)", "Adobe Photoshop", "Adobe Premiere Pro", "SEO", "Digital Production" ]
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
