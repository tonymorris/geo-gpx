-- | Complex Type: @trksegType@ <http://www.topografix.com/GPX/1/1/#type_trksegType>
module Data.Geo.GPX.Trkseg(
  Trkseg,
  trkseg
) where

import Data.Geo.GPX.Wpt
import Data.Geo.GPX.Extensions
import Text.XML.HXT.Arrow

data Trkseg = Trkseg [Wpt] (Maybe Extensions)
  deriving (Eq, Ord)

trkseg ::
  [Wpt] -- ^ The track points (trkpt).
  -> Maybe Extensions -- ^ The extensions.
  -> Trkseg
trkseg =
  Trkseg

