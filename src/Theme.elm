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
    { primary = "#18181a"
    , accent = "#ff2d2d"
    , text = "#ffffff"
    , textLight = "#cccccc"
    , background = "#18181a"
    , surface = "#232326"
    , border = "#ff2d2d"
    , white = "#ffffff"
    , gray = "#232326"
    , success = "#22c55e"
    , error = "#ff2d2d"
    }


type alias FontSize =
    { xs : Css.Rem
    , sm : Css.Rem
    , md : Css.Rem
    , lg : Css.Rem
    , xl : Css.Rem
    , xxl : Css.Rem
    }


fontSize : FontSize
fontSize =
    { xs = Css.rem 0.75 -- 12px
    , sm = Css.rem 0.875 -- 14px
    , md = Css.rem 1 -- 16px (The Standard Base)
    , lg = Css.rem 1.25 -- 20px
    , xl = Css.rem 1.5 -- 24px
    , xxl = Css.rem 2 -- 32px
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
