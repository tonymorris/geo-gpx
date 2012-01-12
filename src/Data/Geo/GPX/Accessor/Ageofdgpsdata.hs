module Data.Geo.GPX.Accessor.Ageofdgpsdata where

import Data.Geo.GPX.Accessor.Accessor

class Ageofdgpsdata a where
  ageofdgpsdata :: a -> Maybe Double
  setAgeofdgpsdata :: Maybe Double -> a -> a

  setAgeofdgpsdata' :: Double -> a -> a
  setAgeofdgpsdata' = setAgeofdgpsdata . Just

  usingAgeofdgpsdata :: (Maybe Double -> Maybe Double) -> a -> a
  usingAgeofdgpsdata = ageofdgpsdata `using` setAgeofdgpsdata

  usingAgeofdgpsdata' :: (Double -> Double) -> a -> a
  usingAgeofdgpsdata' = usingAgeofdgpsdata . fmap
