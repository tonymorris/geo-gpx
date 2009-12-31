module Data.Geo.GPX.Accessor.Time where

import Text.XML.XSD.DateTime

class Time a where
  time :: a -> Maybe DateTime
