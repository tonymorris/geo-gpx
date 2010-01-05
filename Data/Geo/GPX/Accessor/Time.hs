module Data.Geo.GPX.Accessor.Time where

import Text.XML.XSD.DateTime
import Data.Geo.GPX.Accessor.Accessor

class Time a where
  time :: a -> Maybe DateTime
  setTime :: Maybe DateTime -> a -> a

  setTime' :: DateTime -> a -> a
  setTime' = setTime . Just

  usingTime :: (Maybe DateTime -> Maybe DateTime) -> a -> a
  usingTime = time `using` setTime

  usingTime' :: (DateTime -> DateTime) -> a -> a
  usingTime' = usingTime . fmap
