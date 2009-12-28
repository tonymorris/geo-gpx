module Data.Geo.GPX.Accessor.License where

class License a where
  license :: a -> Maybe String
