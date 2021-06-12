module Demo where

{- Redex - expression that can be simpified -}
sumIt ::Int -> Int -> Int
sumIt x y = x + y


add7 :: Int -> Int -> Int
add7 x y = x + 7

{-
add7 1 (2 + 3)
  ~> 1 + 7
  ~> 8

add7 1 (2 + 3)
  ~> add7 1 5
  ~> 1 + 7
  ~> 8
-}

dup :: Int -> (Int, Int)
dup x = (x, x)

{-
Lazy
dup (2+3)
  ~> (2+3, 2+3)
  ~> (5, 2+3)
  ~> (5, 5)

Mehanism rasdeleniya
dup (2+3)
  ~> (p,p)  p=2+3
  ~> (5, p)
  ~> (5,5)

Energetic
dup (2+3)
  ~> dup 5
  ~> (5,5)
-}

{-Strict function - diverges if an argument diverges , diverging computation -}
const42 :: a -> Int
const42 = const 42
{-Normalnaya forma-}
{-
NF
42
(3,4)
\x -> x + 2



not NF
"Real" ++ "world"
sin (pi / 2)
(\x -> x + 2) 5
(3, 1+5)

WHNF
\x -> x + 2*3
(3, 1+5)
(, 4*5)
(+) (7^2)
-}


{-Weak head normal form - slabaya golovnaya normalnaya forma-}

{-
We can break lazy semantic
seq :: a -> b -> b


($!) :: (a -> b) -> a -> b
f $! x = x `seq` f x

x is calculated before being applicated
-}

factorial :: Integer -> Integer
factorial n | n >= 0    = helper 1 n
            | otherwise = error "arg must be >= 0"
  where
    helper acc 0 = acc
    helper acc n = (helper $! (acc * n)) (n - 1)


import Data.Char hiding (toUpper, toLower)
import qualified Data.Set as Set
