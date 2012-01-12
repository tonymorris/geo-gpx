module Data.Geo.GPX.Accessor.Type where

import Data.Geo.GPX.Accessor.Accessor

class Type a where
  type' :: a -> Maybe String
  setType :: Maybe String -> a -> a

  setType' :: String -> a -> a
  setType' = setType . Just

  usingType :: (Maybe String -> Maybe String) -> a -> a
  usingType = type' `using` setType

  usingType' :: (String -> String) -> a -> a
  usingType' = usingType . fmap
