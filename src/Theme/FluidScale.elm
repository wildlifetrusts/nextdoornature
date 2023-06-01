module Theme.FluidScale exposing (fontSize1, fontSize2, fontSize3, fontSize4, fontSizeHeaderBrand, logoContainer)

-- Commented out currently unused: fontSize0, fontSizeMinus1, fontSizeMinus2

import Css exposing (Style, property)



-- https://utopia.fyi/type/calculator?c=320,16,1.2,1240,20,1.25,5,2,&s=0.75|0.5|0.25,1.5|2|3|4|6,s-l&g=s,l,xl,12
--{-| Fluid fontSize
--    @screen width 320px font-size = 12.50px
--    @screen width 1240px font-size = 12.8px
---}
--fontSizeMinus2 : Style
--fontSizeMinus2 =
--    property "font-size" "clamp(0.69rem, calc(0.66rem + 0.18vw), 0.80rem)"
--{-| Fluid fontSize
--    @screen width 320px font-size = 15.00px
--    @screen width 1240px font-size = 16.0px
---}
--fontSizeMinus1 : Style
--fontSizeMinus1 =
--    property "font-size" "clamp(0.83rem, calc(0.78rem + 0.29vw), 1.00rem)"
--{-| Fluid fontSize
--    @screen width 320px font-size = 18.00px
--    @screen width 1240px font-size = 20.0px
---}
--fontSize0 : Style
--fontSize0 =
--    property "font-size" "clamp(1.00rem, calc(0.91rem + 0.43vw), 1.25rem)"


{-| Fluid fontSize

    @screen width 320px font-size = 21.60px
    @screen width 1240px font-size = 25.0px

-}
fontSize1 : Style
fontSize1 =
    property "font-size" "clamp(1.8rem, calc(1.5rem + 1.70vw), 3rem)"


{-| Fluid fontSize

    @screen width 320px font-size = 25.92px
    @screen width 1240px font-size = 31.2px

-}
fontSize2 : Style
fontSize2 =
    property "font-size" "clamp(1.2rem, calc(1rem + 0.89vw), 1.6rem)"


{-| Fluid fontSize

    @screen width 320px font-size = 31.10px
    @screen width 1240px font-size = 39.0px

-}
fontSize3 : Style
fontSize3 =
    property "font-size" "clamp(1.20rem, calc(1rem + 0.43vw), 1.35rem)"


{-| Fluid fontSize

    @screen width 320px font-size = 37.32px
    @screen width 1240px font-size = 48.8px

-}
fontSize4 : Style
fontSize4 =
    property "font-size" "clamp(1.20rem, calc(1.07rem + 0.63vw), 1.56rem)"


{-| Fluid fontSize

    @screen width 320px font-size = 12.50px
    @screen width 1240px font-size = 12.8px

-}
fontSizeHeaderBrand : Style
fontSizeHeaderBrand =
    property "font-size" "clamp(2.49rem, calc(2.03rem + 2.31vw), 3.82rem)"


logoContainer : Style
logoContainer =
    property "max-width" "clamp(16rem, 60vw, 21rem)"
