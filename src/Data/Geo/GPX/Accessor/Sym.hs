module Data.Geo.GPX.Accessor.Sym where

import Data.Geo.GPX.Accessor.Accessor

class Sym a where
  sym :: a -> Maybe String
  setSym :: Maybe String -> a -> a

  setSym' :: String -> a -> a
  setSym' = setSym . Just

  usingSym :: (Maybe String -> Maybe String) -> a -> a
  usingSym = sym `using` setSym

  usingSym' :: (String -> String) -> a -> a
  usingSym' = usingSym . fmap
