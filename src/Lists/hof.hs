-- http://www.cyberforum.ru/haskell/thread1880372.html
nubList = foldl (\xs x-> if not $ x `elem` xs then xs++[x] else xs) []
