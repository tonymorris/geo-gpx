module Data.Geo.GPX.Accessor.Lon where

import Data.Geo.GPX.LongitudeType
import Data.Geo.GPX.Accessor.Accessor

class Lon a where
  lon :: a -> LongitudeType
  setLon :: LongitudeType -> a -> a

  usingLon :: a -> (LongitudeType -> LongitudeType) -> a
  usingLon = lon `using` setLon
