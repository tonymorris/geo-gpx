module Data.Geo.GPX.Accessor.Cmt where

import Data.Geo.GPX.Accessor.Accessor

class Cmt a where
  cmt :: a -> Maybe String
  setCmt :: Maybe String -> a -> a

  setCmt' :: String -> a -> a
  setCmt' = setCmt . Just

  usingCmt :: a -> (Maybe String -> Maybe String) -> a
  usingCmt = cmt `using` setCmt
