module Data.Geo.GPX.Accessor.Keywords where

class Keywords a where
  keywords :: a -> Maybe String
  setKeywords :: Maybe String -> a -> a
