module Geo.GPX.FixType where

data FixType = None | Twod | Threed | Dgps | Pps
  deriving Eq

foldFixType :: a -> a -> a -> a -> a -> FixType -> a
foldFixType none _ _ _ _ None = none
foldFixType _ twod _ _ _ Twod = twod
foldFixType _ _ threed _ _ Threed = threed
foldFixType _ _ _ dgps _ Dgps = dgps
foldFixType _ _ _ _ pps Pps = pps

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
