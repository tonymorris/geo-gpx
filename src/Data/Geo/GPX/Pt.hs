-- | Complex Type: @ptType@ <http://www.topografix.com/GPX/1/1/#type_ptType>
module Data.Geo.GPX.Pt(
  Pt
, pt
) where

import Data.Geo.GPX.Latitude
import Data.Geo.GPX.Longitude
import Text.XML.HXT.Arrow
import Text.XML.XSD.DateTime

data Pt = Pt Latitude Longitude (Maybe Double) (Maybe DateTime)
  deriving (Eq, Ord)

pt ::
  Latitude -- ^ The lat.
  -> Longitude -- ^ The lon.
  -> Maybe Double -- ^ The ele.
  -> Maybe DateTime -- ^ The time.
  -> Pt
pt =
  Pt

