module Geo.GPX.FixType where

data FixType = None | Twod | Threed | Dgps | Pps
  deriving Eq

foldFixType :: a -> a -> a -> a -> a -> FixType -> a
foldFixType n _ _ _ _ None = n
foldFixType _ t _ _ _ Twod = t
foldFixType _ _ t _ _ Threed = t
foldFixType _ _ _ d _ Dgps = d
foldFixType _ _ _ _ p Pps = p

none :: FixType
none = None

twod :: FixType
twod = Twod

threed :: FixType
threed = Threed

dgps :: FixType
dgps = Dgps

pps :: FixType
pps = Pps
