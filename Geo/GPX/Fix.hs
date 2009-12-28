module Geo.GPX.Fix where

data Fix = None | Twod | Threed | Dgps | Pps
  deriving Eq

foldFix :: a -> a -> a -> a -> a -> FixType -> a
foldFix n _ _ _ _ None = n
foldFix _ t _ _ _ Twod = t
foldFix _ _ t _ _ Threed = t
foldFix _ _ _ d _ Dgps = d
foldFix _ _ _ _ p Pps = p

none :: Fix
none = None

twod :: Fix
twod = Twod

threed :: Fix
threed = Threed

dgps :: Fix
dgps = Dgps

pps :: Fix
pps = Pps
