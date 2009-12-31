module Data.Geo.GPX.Accessor.Text where

import Data.Geo.GPX.Accessor.Accessor

class Text a where
  text :: a -> Maybe String
  setText :: Maybe String -> a -> a

  setText' :: String -> a -> a
  setText' = setText . Just

  usingText :: a -> (Maybe String -> Maybe String) -> a
  usingText = text `using` setText
