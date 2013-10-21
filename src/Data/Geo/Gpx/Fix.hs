{-# LANGUAGE NoImplicitPrelude #-}

-- | Simple Type: @fixType@ <http://www.topografix.com/GPX/1/1/#type_fixType>
module Data.Geo.Gpx.Fix(
  Fix
, foldFix
, none
, twod
, threed
, dgps
, pps
, fix
, xpFix
, xpFixElem
) where

import Data.Char(toLower)
import Text.XML.HXT.Core(XmlPickler(..), PU, xpWrapMaybe, xpText, xpElem)
import Control.Lens(Prism', prism', (^?), (#))
import Prelude(Eq, Ord, Show(..), Enum, Maybe(..), String, (.), map)
-- $setup
-- >>> import Prelude
-- >>> import Text.XML.HXT.Core
-- >>> let unpickleFixElem = fmap (unpickleDoc' xpFixElem) . runLA xread
-- >>> let allUnpickledFixElem = all (either (const False) (const True) . unpickleDoc' xpFixElem) . runLA xread

data Fix =
  None
  | Twod
  | Threed
  | Dgps
  | Pps
  deriving (Eq, Ord, Show, Enum)

-- | A prism to a value which will be one of @"none"@, @"twod"@, @"threed"@, @"dgps"@, @"pps"@.
fix ::
  Prism' String Fix
fix =
  prism'
    (map toLower . show)
    (\s -> case s of "none" -> Just none
                     "2d" -> Just twod
                     "3d" -> Just threed
                     "dgps" -> Just dgps
                     "pps" -> Just pps
                     _ -> Nothing)

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

-- | Pickler for the @fix@ element.
--
-- >>> unpickleFixElem "<fix>none</fix>"
-- [Right None]
--
-- >>> unpickleFixElem "<fix>2d</fix>"
-- [Right Twod]
--
-- >>> unpickleFixElem "<fix>3d</fix>"
-- [Right Threed]
--
-- >>> unpickleFixElem "<fix>dgps</fix>"
-- [Right Dgps]
--
-- >>> unpickleFixElem "<fix>pps</fix>"
-- [Right Pps]
--
-- >>> allUnpickledFixElem "<fix>abc</fix>"
-- False
--
-- >>> allUnpickledFixElem "<f>none</f>"
-- False
xpFixElem ::
  PU Fix
xpFixElem =
  xpElem "fix"
    xpFix

-- | Pickler for the @Fix@ type.
xpFix ::
  PU Fix
xpFix =
  xpWrapMaybe ((^? fix), (#) fix) xpText

instance XmlPickler Fix where
  xpickle =
    xpFix
