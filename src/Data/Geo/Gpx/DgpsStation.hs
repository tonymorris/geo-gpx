{-# LANGUAGE NoImplicitPrelude #-}

-- | Simple Type: @dgpsStationType@ <http://www.topografix.com/GPX/1/1/#type_dgpsStationType>
module Data.Geo.Gpx.DgpsStation(
  DgpsStation
, dgpsStation
, xpDgpsidElem
, xpDgpsStation
) where

import Text.XML.HXT.Core(XmlPickler(..), PU, xpElem, xpWrapMaybe, xpPrim)
import Control.Lens(Prism', prism', (^?), (#))
import Prelude(Maybe(..), Int, Eq, Ord(..), Show, (&&))

-- $setup
-- >>> import Prelude
-- >>> import Text.XML.HXT.Core
-- >>> let unpickleDgpsidElem = fmap (unpickleDoc' xpDgpsidElem) . runLA xread
-- >>> let allUnpickledDgpsidElem = all (either (const False) (const True) . unpickleDoc' xpDgpsidElem) . runLA xread

newtype DgpsStation =
  DgpsStation Int
  deriving (Eq, Ord, Show)

-- | A prism to a value which will be between 0 and 1023.
dgpsStation ::
  Prism' Int DgpsStation
dgpsStation =
  prism'
    (\(DgpsStation i) -> i)
    (\i -> if i >= 0 && i <= 1023 then Just (DgpsStation i) else Nothing)

-- | Pickler for the @dgpsid@ element.
--
-- >>> unpickleDgpsidElem "<dgpsid>0</dgpsid>"
-- [Right (DgpsStation 0)]
--
-- >>> unpickleDgpsidElem "<dgpsid>3</dgpsid>"
-- [Right (DgpsStation 3)]
--
-- >>> unpickleDgpsidElem "<dgpsid>1</dgpsid>"
-- [Right (DgpsStation 1)]
--
-- >>> unpickleDgpsidElem "<dgpsid>1022</dgpsid>"
-- [Right (DgpsStation 1022)]
--
-- >>> unpickleDgpsidElem "<dgpsid>1023</dgpsid>"
-- [Right (DgpsStation 1023)]
--
-- >>> allUnpickledDgpsidElem "<dgpsid>-1</dgpsid>"
-- False
--
-- >>> allUnpickledDgpsidElem "<dgpsid>1024</dgpsid>"
-- False
xpDgpsidElem ::
  PU DgpsStation
xpDgpsidElem =
  xpElem "dgpsid"
    xpDgpsStation

-- | Pickler for the @DgpsStation@ type.
xpDgpsStation ::
  PU DgpsStation
xpDgpsStation =
  xpWrapMaybe ((^? dgpsStation), (#) dgpsStation) xpPrim

instance XmlPickler DgpsStation where
  xpickle =
    xpDgpsStation
