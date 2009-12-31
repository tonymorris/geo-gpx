module Data.Geo.GPX.Accessor.Year where

import Data.Geo.GPX.Accessor.Accessor

class Year a where
  year :: a -> Maybe String
  setYear :: Maybe String -> a -> a

  setYear' :: String -> a -> a
  setYear' = setYear . Just

  usingYear :: a -> (Maybe String -> Maybe String) -> a
  usingYear = year `using` setYear
