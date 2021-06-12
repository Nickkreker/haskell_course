module Demo where

{-
class Eq a where
  (==), (/=) :: a -> a -> Bool
  x /= y  =  not (x == y)
  x == y  =  not (x /= y)

instance Eq Bool where
  True  == True   = True
  False == False  = True
  _     == _      = False

instance (Eq a, Eq b) => Eq (a,b) where
  p1 == p2  =  fst p1 == fst p2 && snd p1 == snd p2

class (Eq a) => Ord a where
  (<), (<=), (>=), (>) :: a -> a -> Bool
  max, min :: a -> a -> a
  compare :: a -> a -> Ordering
{- Minimal complete definition: either compare or <= -}

{- Multiple inheritance is allowed -}
class (Eq a, Printable a) => MyClass a where
  ...
-}


{- Task 1 -}
class Printable a where
  toString :: a -> [Char]

instance Printable Bool where
  toString True   =   "true"
  toString False  =   "false"

instance Printable () where
  toString ()  =  "unit type"

instance (Printable a, Printable b) => Printable (a, b) where
  toString p = '(' : toString (fst p) ++ (',' : toString (snd p)) ++ ")"




{- Task 2 -}
class KnownToGork a where
  stomp :: a -> a
  doesEnrageGork :: a -> Bool

class KnownToMork a where
  stab :: a -> a
  doesEnrageMork :: a -> Bool

class (KnownToGork a, KnownToMork a) => KnownToGorkAndMork a where
  stompOrStab :: a -> a
  stompOrStab a
    | doesEnrageGork a && doesEnrageMork a  =  stomp (stab a)
    | doesEnrageMork a                      =  stomp a
    | doesEnrageGork a                      =  stab  a
    | otherwise                             =  a

{-
class Enum a where
  succ, pred :: a -> a
  toEnum :: Int -> a
  fromEnum :: a -> Int

class Bounded a where
  minBound, maxBound :: a
-}

{- Task 3 -}
class (Eq a, Enum a, Bounded a) => SafeEnum a where
  ssucc :: a -> a
  ssucc a = if a == maxBound then minBound else succ a
  spred :: a -> a
  spred a = if a == minBound then maxBound else pred a

instance SafeEnum Int
instance SafeEnum Bool

{-
class Num a where
  (+), (-), (*) :: a -> a -> a
  negate :: a -> a
  abs :: a -> a
  signum :: a -> a
  fromInteger :: Integer -> a

  x - y = x + negate y
  negate x = 0 - x
-}

avg :: Int -> Int -> Int -> Double
avg a b c = fromIntegral a / 3.0 + fromIntegral b / 3.0 + fromIntegral c / 3.0
