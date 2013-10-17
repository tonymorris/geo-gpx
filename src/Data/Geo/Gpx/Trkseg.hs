-- | Complex Type: @trksegType@ <http://www.topografix.com/GPX/1/1/#type_trksegType>
module Data.Geo.Gpx.Trkseg(
  Trkseg,
  trkseg
) where

import Data.Geo.Gpx.Wpt
import Data.Geo.Gpx.Extensions

data Trkseg = Trkseg [Wpt] (Maybe Extensions)
  deriving Eq

trkseg ::
  [Wpt] -- ^ The track points (trkpt).
  -> Maybe Extensions -- ^ The extensions.
  -> Trkseg
trkseg =
  Trkseg

{-
instance TrkptsL Trkseg where
  trkptsL =
    Lens $ \(Trkseg trkpts extensions) -> store (\trkpts -> Trkseg trkpts extensions) trkpts

instance ExtensionsL Trkseg where
  extensionsL =
    Lens $ \(Trkseg trkpts extensions) -> store (\extensions -> Trkseg trkpts extensions) extensions
-}

{-
instance XmlPickler Trkseg where
  xpickle =
    xpWrap (uncurry trkseg, \(Trkseg trkpt' extensions') -> (trkpt', extensions')) (xpPair
      (xpList (xpElem "trkpt" xpickle))
      (xpOption (xpElem "extensions" xpickle)))
-}
