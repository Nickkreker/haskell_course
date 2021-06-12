import Data.Char

readDigits :: String -> (String, String)
readDigits str = span isDigit str

filterDisj :: (a -> Bool) -> (a -> Bool) -> [a] -> [a]
filterDisj p1 p2 [] = []
filterDisj p1 p2 (x:xs)
  | p1 x || p2 x = x : filterDisj p1 p2 xs
  | otherwise = filterDisj p1 p2 xs

filterDisj' :: (a -> Bool) -> (a -> Bool) -> [a] -> [a]
filterDisj' p1 p2 = filter (\x -> p1 x || p2 x)


qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort [x] = [x]
qsort (x:xs) = qsort (filter (<=x) xs) ++ [x] ++ qsort (filter (>x) xs)

squares'n'cubes :: Num a => [a] -> [a]
squares'n'cubes xs = concatMap (\i -> [i^2, i^3]) xs

perms :: [a] -> [[a]]
