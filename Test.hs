{-
fibonacci ::Integer -> Integer
fibonacci n | n == 0 = 0
            | n == 1 = 1
            | n == -1 = 1
            | (n < 0) && ((n `mod` 2) == 0) = (-1) * (fibonacci ((-n) - 1) + fibonacci ((-n) - 2))
            | (n < 0) = (fibonacci ((-n) - 1) + fibonacci ((-n) - 2))
            | otherwise = fibonacci (n - 1) + fibonacci (n- 2)
-}


{-
fibonacci :: Integer -> Integer
fibonacci n | n == -1 = 1
            | (n < 0) && (n `mod` 2 == 0) = (-1)* helper 0 1 (-n)
            | n < 0 = helper 0 1 (-n)
            | otherwise = helper 0 1 n

helper x y n = if n == 0 then x else helper y (x+y) (n-1)
-}
{-
module Test where

roots :: Double -> Double -> Double
          -> (Double, Double)
roots a b c =
  (
    (-b - sqrt (b ^ 2 - 4 * a * c)) / (2 * a)
  ,
    (-b + sqrt (b ^ 2 - 4 * a * c)) / (2 * a)
  )

roots' a b c =
  let d = sqrt (b ^ 2 - 4 * a * c) in
  ((-b - d) / (2 * a), (-b + d) / (2 * a))
  -}

{-
seqA :: Integer -> Integer
seqA n | n == 0 = 1
       | n == 1 = 2
       | n == 2 = 3
       | otherwise = let
            helper a b c 0 = c
            helper a b c n = helper b c (b+c-2*a) (n-1)
         in helper 1 2 3 (n-2)
-}

{-
sum'n'count :: Integer -> (Integer, Integer)

sum'n'count n | n == 0 = (0, 1)
              | n > 0 = helper 0 0 n
              | otherwise = helper 0 0 (-n)
  where
    helper x y 0 = (x, y)
    helper x y n = helper (x + n `mod` 10) (y + 1) (n `div` 10)
    -}
integration :: (Double -> Double) -> Double -> Double -> Double
integration f a b | a == b = 0
                  | a > b = -1 * helper ((a - b)/ 2000) f a b 0
                  | otherwise = helper ((b - a) / 2000) f b a 0
    where
        helper delta f r x s = if x > r then s else helper delta f r (x + delta) (s + delta * f x)
