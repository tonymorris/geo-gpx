module Data.Geo.GPX.Accessor.Sat where

import Data.Geo.GPX.Accessor.Accessor

class Sat a where
  sat :: a -> Maybe Int
  setSat :: Maybe Int -> a -> a

  setSat' :: Int -> a -> a
  setSat' = setSat . Just

  usingSat :: a -> (Maybe Int -> Maybe Int) -> a
  usingSat = sat `using` setSat
