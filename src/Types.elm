module Types exposing
    ( Contact
    , CvData
    , Experience
    , Page(..)
    , Project
    , Skill
    , SocialLink
    )


type alias CvData =
    { name : String
    , title : String
    , summary : String
    , profileImage : String
    , experiences : List Experience
    , projects : List Project
    , skills : List Skill
    , contact : Contact
    }


type alias Experience =
    { company : String
    , position : String
    , startDate : String
    , endDate : String
    , description : String
    , technologies : List String
    }


type alias Project =
    { name : String
    , description : String
    , technologies : List String
    , highlights : List String
    , link : Maybe String
    }


type alias Skill =
    { category : String
    , items : List String
    }


type alias Contact =
    { email : String
    , phone : String
    , location : String
    , links : List SocialLink
    }


type alias SocialLink =
    { label : String
    , url : String
    }


type Page
    = Home
    | ExperiencePage
    | ProjectsPage
    | SkillsPage
    | NotFound
