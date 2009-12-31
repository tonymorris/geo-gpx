module Data.Geo.GPX.Accessor.Keywords where

import Data.Geo.GPX.Accessor.Accessor

class Keywords a where
  keywords :: a -> Maybe String
  setKeywords :: Maybe String -> a -> a

  setKeywords' :: String -> a -> a
  setKeywords' = setKeywords . Just

  usingKeywords :: a -> (Maybe String -> Maybe String) -> a
  usingKeywords = keywords `using` setKeywords
