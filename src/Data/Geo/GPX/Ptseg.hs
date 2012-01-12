-- | Complex Type: @ptsegType@ <http://www.topografix.com/GPX/1/1/#type_ptsegType>
module Data.Geo.GPX.Ptseg(
  Ptseg
, ptseg
) where

import Data.Geo.GPX.Pt
import Text.XML.HXT.Arrow

newtype Ptseg = Ptseg [Pt]
  deriving (Eq, Ord)

ptseg ::
  [Pt] -- ^ The points (pt).
  -> Ptseg
ptseg =
  Ptseg
