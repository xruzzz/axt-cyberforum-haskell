-- http://www.cyberforum.ru/haskell/thread1899043.html
{-# LANGUAGE UnicodeSyntax #-}
data LogLevel = Error | Warning | Info
          deriving (Show, Eq, Enum)

cmp :: LogLevel -> LogLevel -> Ordering 
cmp x y
    | x == y = EQ
    | x == Info = LT
    | x == Error = GT
    | y == Info = GT
    | otherwise = LT

showOrd x = case x of 
        LT -> "<" 
        GT -> ">"
        _ -> "="

main =  putStrLn . unlines $ [showLine x y| x <- lvls, y <- lvls]
    where lvls = reverse [Error .. Info]
          showLine x y = show x ++ "\t" ++ showOrd (cmp x y) ++ " " ++ show y
