module Day02
  ( part1,
    handleInput
  )
where

import GHC.Utils.Misc (count)

handleInput :: String -> [[Int]]
handleInput = map (map read . words) . lines

part1 :: [[Int]] -> Int
part1 = count isSafe

isSafe :: [Int] -> Bool
isSafe xs = case xs of
    [] -> True
    [_] -> True
    (x:y:_) | x > y -> isSafeDecreasing xs
    (x:y:_) | x < y -> isSafeIncreasing xs
    _ -> False

isSafeDecreasing :: [Int] -> Bool
isSafeDecreasing [] = True
isSafeDecreasing [_] = True
isSafeDecreasing (x:y:xs)
    | x>y && x-y<4 = isSafeDecreasing (y:xs)
    | otherwise = False

isSafeIncreasing :: [Int] -> Bool
isSafeIncreasing [] = True
isSafeIncreasing [_] = True
isSafeIncreasing (x:y:xs)
    | x<y && y-x<4 = isSafeIncreasing (y:xs)
    | otherwise = False