module Types exposing (Contact, CvData, Experience, Flags, LanguageCode(..), Project, Skill, SocialLink, allLanguageCodes)

import I18n


type alias Flags =
    { translations : I18n.Translations
    , selectedLanguage : LanguageCode
    }


type LanguageCode
    = En
    | Es
    | Sk
    | Cs


allLanguageCodes : List LanguageCode
allLanguageCodes =
    [ En, Es, Cs, Sk ]


type alias LanguageProficiency =
    { name : String, percent : Float }


type alias CvData =
    { name : String
    , title : String
    , summary : List String
    , profileImage : String
    , experiences : List Experience
    , projects : { description : String, githubProjects : List Project }
    , skills : List Skill
    , languages : List LanguageProficiency
    , contact : Contact
    , elmTopics : List String
    }


type alias Experience =
    { company : String
    , position : String
    , startDate : String
    , endDate : String
    , description : List String
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
