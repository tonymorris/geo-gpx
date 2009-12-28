module Data.Geo.GPX.Accessor.Ageofdgpsdata where

class Ageofdgpsdata a where
  ageofdgpsdata :: a -> Maybe Double
