-- | Complex Type: @trksegType@ <http://www.topografix.com/GPX/1/1/#type_trksegType>
module Data.Geo.GPX.Trkseg(
  Trkseg,
  trkseg
) where

import Data.Geo.GPX.Wpt
import Data.Geo.GPX.Extensions
import Data.Geo.GPX.Lens.TrkptsL
import Data.Geo.GPX.Lens.ExtensionsL
import Data.Lens.Common
import Control.Comonad.Trans.Store
import Text.XML.HXT.Arrow

data Trkseg = Trkseg [Wpt] (Maybe Extensions)
  deriving (Eq, Ord)

trkseg ::
  [Wpt] -- ^ The track points (trkpt).
  -> Maybe Extensions -- ^ The extensions.
  -> Trkseg
trkseg =
  Trkseg

instance TrkptsL Trkseg where
  trkptsL =
    Lens $ \(Trkseg trkpts extensions) -> store (\trkpts -> Trkseg trkpts extensions) trkpts

instance ExtensionsL Trkseg where
  extensionsL =
    Lens $ \(Trkseg trkpts extensions) -> store (\extensions -> Trkseg trkpts extensions) extensions

