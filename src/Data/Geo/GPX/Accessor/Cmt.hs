module Data.Geo.GPX.Accessor.Cmt where

import Data.Geo.GPX.Accessor.Accessor

class Cmt a where
  cmt :: a -> Maybe String
  setCmt :: Maybe String -> a -> a

  setCmt' :: String -> a -> a
  setCmt' = setCmt . Just

  usingCmt :: (Maybe String -> Maybe String) -> a -> a
  usingCmt = cmt `using` setCmt

  usingCmt' :: (String -> String) -> a -> a
  usingCmt' = usingCmt . fmap
