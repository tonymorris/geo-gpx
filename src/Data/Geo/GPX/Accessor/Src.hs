module Data.Geo.GPX.Accessor.Src where

import Data.Geo.GPX.Accessor.Accessor

class Src a where
  src :: a -> Maybe String
  setSrc :: Maybe String -> a -> a

  setSrc' :: String -> a -> a
  setSrc' = setSrc . Just

  usingSrc :: (Maybe String -> Maybe String) -> a -> a
  usingSrc = src `using` setSrc

  usingSrc' :: (String -> String) -> a -> a
  usingSrc' = usingSrc . fmap
