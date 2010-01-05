module Data.Geo.GPX.Accessor.Sat where

import Data.Geo.GPX.Accessor.Accessor

class Sat a where
  sat :: a -> Maybe Int
  setSat :: Maybe Int -> a -> a

  setSat' :: Int -> a -> a
  setSat' = setSat . Just

  usingSat :: (Maybe Int -> Maybe Int) -> a -> a
  usingSat = sat `using` setSat

  usingSat' :: (Int -> Int) -> a -> a
  usingSat' = usingSat . fmap
