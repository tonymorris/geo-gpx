{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies #-}
module Data.Geo.GPX.Accessor.Value where

import Data.Geo.GPX.Accessor.Accessor

class Value a b | a -> b where
  value :: a -> b
  setValue :: b -> a -> a

  usingValue :: a -> (b -> b) -> a
  usingValue = value `using` setValue
