module Data.Geo.GPX.FixType where

import Text.XML.HXT.Arrow

data FixType = None | Twod | Threed | Dgps | Pps
  deriving (Eq, Enum)

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

fixType :: String -> Maybe FixType
fixType "none" = Just Data.Geo.GPX.FixType.none
fixType "2d"= Just twod
fixType "3d" = Just threed
fixType "dgps" = Just dgps
fixType "pps" = Just pps
fixType _ = Nothing

instance XmlPickler FixType where
  xpickle = xpWrapMaybe (fixType, show) xpText

instance Show FixType where
  show = foldFixType "none" "2d" "3d" "dgps" "pps"
