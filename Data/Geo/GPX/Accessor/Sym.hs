module Data.Geo.GPX.Accessor.Sym where

import Data.Geo.GPX.Accessor.Accessor

class Sym a where
  sym :: a -> Maybe String
  setSym :: Maybe String -> a -> a

  setSym' :: String -> a -> a
  setSym' = setSym . Just

  usingSym :: a -> (Maybe String -> Maybe String) -> a
  usingSym = sym `using` setSym
