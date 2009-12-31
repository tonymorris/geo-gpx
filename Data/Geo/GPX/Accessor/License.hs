module Data.Geo.GPX.Accessor.License where

class License a where
  license :: a -> Maybe String
  setLicense :: Maybe String -> a -> a
