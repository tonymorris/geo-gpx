module Data.Geo.GPX.Accessor.Type where

import Data.Geo.GPX.Accessor.Accessor

class Type a where
  type' :: a -> Maybe String
  setType :: Maybe String -> a -> a

  setType' :: String -> a -> a
  setType' = setType . Just

  usingType :: a -> (Maybe String -> Maybe String) -> a
  usingType = type' `using` setType
