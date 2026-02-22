module Theme exposing
    ( Color
    , FontSize
    , Spacing
    , color
    , fontSize
    , spacing
    )

import Css
import Util.Css as CssUtil


type alias Color =
    { primary : Css.Color
    , accent : Css.Color
    , text : Css.Color
    , textLight : Css.Color
    , background : Css.Color
    , surface : Css.Color
    , border : Css.Color
    , white : Css.Color
    , gray : Css.Color
    , success : Css.Color
    , error : Css.Color
    }


color : Color
color =
    { primary = CssUtil.toHex stringColor.primary
    , accent = CssUtil.toHex stringColor.accent
    , text = CssUtil.toHex stringColor.text
    , textLight = CssUtil.toHex stringColor.textLight
    , background = CssUtil.toHex stringColor.background
    , surface = CssUtil.toHex stringColor.surface
    , border = CssUtil.toHex stringColor.border
    , white = CssUtil.toHex stringColor.white
    , gray = CssUtil.toHex stringColor.gray
    , success = CssUtil.toHex stringColor.success
    , error = CssUtil.toHex stringColor.error
    }


type alias StringColor =
    { primary : String
    , accent : String
    , text : String
    , textLight : String
    , background : String
    , surface : String
    , border : String
    , white : String
    , gray : String
    , success : String
    , error : String
    }


stringColor : StringColor
stringColor =
    { primary = "#18181a" -- deep black
    , accent = "#ff2d2d" -- red accent
    , text = "#ffffff" -- white text
    , textLight = "#cccccc" -- lighter gray
    , background = "#18181a" -- deep black
    , surface = "#232326" -- dark gray for cards
    , border = "#ff2d2d" -- red border
    , white = "#ffffff"
    , gray = "#232326" -- dark gray
    , success = "#22c55e"
    , error = "#ff2d2d" -- red for errors
    }


type alias FontSize =
    { xs : Float
    , sm : Float
    , md : Float
    , lg : Float
    , xl : Float
    , xxl : Float
    }


fontSize : FontSize
fontSize =
    { xs = 12
    , sm = 13
    , md = 14
    , lg = 16
    , xl = 20
    , xxl = 28
    }


type alias Spacing =
    { xs : Float
    , sm : Float
    , md : Float
    , lg : Float
    , xl : Float
    , xxl : Float
    }


spacing : Spacing
spacing =
    { xs = 4
    , sm = 8
    , md = 16
    , lg = 24
    , xl = 32
    , xxl = 48
    }
