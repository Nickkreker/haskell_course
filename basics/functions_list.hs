-- [] - create empty list
-- 3 : []  == [3]
-- : is right associative

-- task 1
addTwoElements :: a -> a -> [a] -> [a]
addTwoElements x y list = x : mod_list where
  mod_list = y : list

-- task 2
nTimes :: a -> Int -> [a]
nTimes a n = if n == 0 then [] else helper a [a] (n - 1) where
  helper a list 0 = list
  helper a list n = helper a (a:list) (n - 1)

{-
Deconstruction
head, tail
-}

second :: [a] -> a
second = head . tail

second' :: [a] -> a
second' (_ : xs) = head xs

second'' :: [a] -> a
second'' (_ : x : _) = x

tail' :: [a] -> [a]
tail' (_ : xs) = xs

{-
import Prelude hiding (length, (++), null)

length :: [a] -> Int
length []     = 0
length (_:xs) = 1 + length xs

(++) :: [a] -> [a] -> [a]
[] ++ ys     = ys
(x:xs) ++ ys = x : xs ++ ys

null :: [a] -> Bool
null []  = True
null _   = False

last :: [a] -> a
last (x:[]) = x
last (_:xs) = last xs

init :: [a] -> [a]
init []     = error "ERROR!!"
init [_]    = []
init (x:xs) = x : init xs

sum, product :: (Num a) => [a] -> a
maximum, minimum :: (Ord a) => [a] -> a

reverse :: [a] -> [a]
reverse l =  rev l [] where
  rev []     a = a
  rev (x:xs) a = rev xs (x:a)

zip :: [a] -> [b] -> [(a,b)]
zip [] _        = []
zip as []         = []
zip (a:as) (b:bs) = (a,b) : zip as bs

zip3 :: [a] -> [b] -> [c] -> [(a,b,c)]
...

unzip :: [(a,b)] -> ([a], [b])
unzip [] = ([], [])
unzip ((x,y):xys) =
  let (xs, ys) = unzip xys
  in (x:xs,y:ys)
-}


oddsOnly :: Integral a => [a] -> [a]
oddsOnly []     = []
oddsOnly (x:xs) = if x `mod` 2  == 1 then x : oddsOnly xs else oddsOnly xs


isPalindrome :: Eq a => [a] -> Bool
isPalindrome []  = True
isPalindrome [_] = True
isPalindrome xs = if head xs == last xs then isPalindrome (tail (init xs)) else False

sum3 :: Num a => [a] -> [a] -> [a] -> [a]
sum3 [] [] [] = []
sum3 [] [] (c:cs) = c : (sum3 [] [] cs)
sum3 [] (b:bs) [] = b : (sum3 [] bs [])
sum3 (a:as) [] [] = a : (sum3 as [] [])
sum3 (a:as) (b:bs) [] = (a+b) : (sum3 as bs [])
sum3 [] (b:bs) (c:cs) = (b+c) : (sum3 [] bs cs)
sum3 (a:as) [] (c:cs) = (a+c) : (sum3 as [] cs)
sum3 (a:as) (b:bs) (c:cs) = (a+b+c) : (sum3 as bs cs)

groupElems :: Eq a => [a] -> [[a]]
groupElems [] = []
groupElems [x] = [[x]]
groupElems (x:xs) = helper xs [x] []
  where
    helper [] temp as = as ++ [temp]
    helper (x:xs) temp as = if x == head temp then helper xs (x:temp) as else helper xs [x] (as ++ [temp])

{-
sum3 (a:as) bs cs
  | length as < length bs = sum3 (as ++ [0]) bs cs
  | length as > length bs = sum3 as (bs ++ [0]) cs
  | length as > length cs = sum3 as bs (cs ++ [0])
  | length as < length cs = sum3 (as ++ [0]) (bs ++ [0]) cs
  | otherwise = helper (zip3 as bs cs)

helper [(a,b,c)] = [a+b+c]
helper ((a,b,c):xs) = (a + b + c) : helper xs
-}

{-
zip, zip3, take, drop, splitAt, reverse, last, product, head, init,
"Hello world" !! 6 - return element at index 6

take :: Int -> [a] -> [a]
-}

{-
Higher order functions
filter :: (a -> Bool) -> [a] -> [a]

takeWhile :: (a->Bool) -> [a] -> [a]

dropWhile :: (a->Bool) -> [a] -> [a]

span ::  (a -> Bool) -> [a] -> ([a], [a])

break :: (a -> Bool) -> [a] -> ([a], [a])

map :: (a -> b) -> [a] -> [b]

concat :: [[a]] -> [a]

concatMap :: (a->[b]) -> [a] -> [b]
concatMap f = concat . map f
-}

filter :: (a->Bool)->[a]->[a]
filter p [] = []
filter p (x:xs)
  | p x       = x : filter p xs
  | otherwise = filter p xs

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile _ [] = []
dropWhile p xs@(x:xs')
  | p x = dropWhile p xs'
  | otherwise = xs


-- task
import Data.Char

readDigits :: String -> (String, String)
readDigits str = span (isDigit str)
