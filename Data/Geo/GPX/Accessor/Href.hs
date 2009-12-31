module Data.Geo.GPX.Accessor.Href where

import Data.Geo.GPX.Accessor.Accessor

class Href a where
  href :: a -> String
  setHref :: String -> a -> a

  usingHref :: a -> (String -> String) -> a
  usingHref = href `using` setHref
