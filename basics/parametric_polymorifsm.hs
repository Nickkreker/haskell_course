{-
let id x = x

let k x y = x

undefined - konstanta proisvolnogo tipa

error "AAA!!!!!111"
-}

module Demo where
import Data.Function



getSecondFrom :: p1 -> p2 -> p3 -> p2
getSecondFrom x y z = y


mono :: Char -> Char
mono x = x

semiMono :: Char -> a -> Char
semiMono x y = x



multSecond = g `on` h

g = (*)

h = snd


sumFstFst = (+) `on` helper
  where helper pp = fst $ fst pp

sumFstFst' = (+) `on` (\pp -> fst $ fst pp)

sumFstFst'' = (+) `on` (fst . fst)

on3 :: (b -> b -> b -> c) -> (a -> b) -> a -> a -> a -> c
on3 op f x y z = op (f x) (f y) (f z)


avg :: (Double, Double) -> Double
avg p = (fst p + snd p) / 2
