module Data.Geo.GPX.Accessor.Desc where

import Data.Geo.GPX.Accessor.Accessor

class Desc a where
  desc :: a -> Maybe String
  setDesc :: Maybe String -> a -> a

  setDesc' :: String -> a -> a
  setDesc' = setDesc . Just

  usingDesc :: (Maybe String -> Maybe String) -> a -> a
  usingDesc = desc `using` setDesc

  usingDesc' :: (String -> String) -> a -> a
  usingDesc' = usingDesc . fmap
