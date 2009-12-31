module Data.Geo.GPX.Accessor.Ageofdgpsdata where

import Data.Geo.GPX.Accessor.Accessor

class Ageofdgpsdata a where
  ageofdgpsdata :: a -> Maybe Double
  setAgeofdgpsdata :: Maybe Double -> a -> a

  setAgeofdgpsdata' :: Double -> a -> a
  setAgeofdgpsdata' = setAgeofdgpsdata . Just

  usingAgeofdgpsdata :: a -> (Maybe Double -> Maybe Double) -> a
  usingAgeofdgpsdata = ageofdgpsdata `using` setAgeofdgpsdata
