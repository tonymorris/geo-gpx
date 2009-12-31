module Data.Geo.GPX.Accessor.Domain where

import Data.Geo.GPX.Accessor.Accessor

class Domain a where
  domain :: a -> String
  setDomain :: String -> a -> a

  usingDomain :: a -> (String -> String) -> a
  usingDomain = domain `using` setDomain
