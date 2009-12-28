module Data.Geo.GPX.Accessor.Time where

class Time a where
  time :: a -> Maybe String
