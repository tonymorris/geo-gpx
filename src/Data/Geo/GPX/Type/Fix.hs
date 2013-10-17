-- | Simple Type: @fixType@ <http://www.topografix.com/GPX/1/1/#type_fixType>
module Data.Geo.GPX.Type.Fix(
  Fix
, foldFix
, none
, twod
, threed
, dgps
, pps
, fix
) where

-- import Text.XML.HXT.Arrow.Pickle

data Fix = None | Twod | Threed | Dgps | Pps
  deriving (Eq, Ord, Show, Enum)

-- | The catamorphism for @Fix@.
foldFix ::
  a -- ^ The value if @none@.
  -> a -- ^ The value if @twod@.
  -> a -- ^ The value if @threed@.
  -> a -- ^ The value if @dgps@.
  -> a -- ^ The value if @pps@.
  -> Fix -- ^ The value to fold.
  -> a
foldFix n _ _ _ _ None = n
foldFix _ t _ _ _ Twod = t
foldFix _ _ t _ _ Threed = t
foldFix _ _ _ d _ Dgps = d
foldFix _ _ _ _ p Pps = p

-- | Construct a @Fix@ with a value of @none@.
none ::
  Fix
none =
  None

-- | Construct a @Fix@ with a value of @2d@.
twod :: Fix
twod = Twod

-- | Construct a @Fix@ with a value of @3d@.
threed ::
  Fix
threed =
  Threed

-- | Construct a @Fix@ with a value of @dgps@.
dgps ::
  Fix
dgps =
  Dgps

-- | Construct a @Fix@ with a value of @pps@.
pps ::
  Fix
pps =
  Pps

-- | Construct a @Fix@ using a string with a value of @["none", "2d", "3d", "dgps", "pps"]@.
fix ::
  String -- ^ The string value to construct a @Fix@ with.
  -> Maybe Fix
fix "none" = Just none
fix "2d"= Just twod
fix "3d" = Just threed
fix "dgps" = Just dgps
fix "pps" = Just pps
fix _ = Nothing

{-
instance XmlPickler Fix where
  xpickle =
    xpWrapMaybe (fix, show) xpText
-}
