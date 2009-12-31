module Data.Geo.GPX.Accessor.Number where

import Data.Geo.GPX.Accessor.Accessor

class Number a where
  number :: a -> Maybe Int
  setNumber :: Maybe Int -> a -> a

  setNumber' :: Int -> a -> a
  setNumber' = setNumber . Just

  usingNumber :: a -> (Maybe Int -> Maybe Int) -> a
  usingNumber = number `using` setNumber
