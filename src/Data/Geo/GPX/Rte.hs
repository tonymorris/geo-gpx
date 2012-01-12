-- | Complex Type: @rteType@ <http://www.topografix.com/GPX/1/1/#type_rteType>
module Data.Geo.GPX.Rte(
  Rte
, rte
) where

import Data.Geo.GPX.Wpt
import Data.Geo.GPX.Extensions
import Data.Geo.GPX.Link
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras

data Rte = Rte (Maybe String) (Maybe String) (Maybe String) (Maybe String) [Link] (Maybe Int) (Maybe String) (Maybe Extensions) [Wpt]
  deriving (Eq, Ord)

rte ::
  Maybe String -- ^ The name.
  -> Maybe String -- ^ The cmt.
  -> Maybe String -- ^ The desc.
  -> Maybe String -- ^ The src.
  -> [Link] -- ^ The links (link).
  -> Maybe Int -- ^ The number.
  -> Maybe String -- ^ The type.
  -> Maybe Extensions -- ^ The extensions.
  -> [Wpt] -- ^ The route points (rtept).
  -> Rte
rte a b c d e f =
  Rte a b c d e (fmap abs f)

