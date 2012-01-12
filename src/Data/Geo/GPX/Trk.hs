-- | Complex Type: @trkType@ <http://www.topografix.com/GPX/1/1/#type_trkType>
module Data.Geo.GPX.Trk(
  Trk
, trk
) where

import Data.Geo.GPX.Trkseg
import Data.Geo.GPX.Extensions
import Data.Geo.GPX.Link
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras

data Trk = Trk (Maybe String) (Maybe String) (Maybe String) (Maybe String) [Link] (Maybe Int) (Maybe String) (Maybe Extensions) [Trkseg]
  deriving (Eq, Ord)

trk ::
  Maybe String -- ^ The name.
  -> Maybe String -- ^ The cmt.
  -> Maybe String -- ^ The desc.
  -> Maybe String -- ^ The src.
  -> [Link] -- ^ The links (link).
  -> Maybe Int -- ^ The number.
  -> Maybe String -- ^ The type.
  -> Maybe Extensions -- ^ The extensions.
  -> [Trkseg] -- ^ The track segments (trkseg).
  -> Trk
trk a b c d e f =
  Trk a b c d e (fmap abs f)

