-- | Simple Type: @fixType@ <http://www.topografix.com/GPX/1/1/#type_fixType>
module Data.Geo.GPX.FixType where

import Text.XML.HXT.Arrow

data FixType = None | Twod | Threed | Dgps | Pps
  deriving (Eq, Enum)

-- | The catamorphism for @FixType@.
foldFixType :: a -- ^ The value if @none@.
               -> a -- ^ The value if @twod@.
               -> a -- ^ The value if @threed@.
               -> a -- ^ The value if @dgps@.
               -> a -- ^ The value if @pps@.
               -> FixType -- ^ The value to fold.
               -> a
foldFixType n _ _ _ _ None = n
foldFixType _ t _ _ _ Twod = t
foldFixType _ _ t _ _ Threed = t
foldFixType _ _ _ d _ Dgps = d
foldFixType _ _ _ _ p Pps = p

-- | Construct a @FixType@ with a value of @none@.
none :: FixType
none = None

-- | Construct a @FixType@ with a value of @2d@.
twod :: FixType
twod = Twod

-- | Construct a @FixType@ with a value of @3d@.
threed :: FixType
threed = Threed

-- | Construct a @FixType@ with a value of @dgps@.
dgps :: FixType
dgps = Dgps

-- | Construct a @FixType@ with a value of @pps@.
pps :: FixType
pps = Pps

-- | Construct a @FixType@ using a string with a value of @["none", "2d", "3d", "dgps", "pps"]@.
fixType :: String -- ^ The string value to construct a @FixType@ with.
           -> Maybe FixType
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
