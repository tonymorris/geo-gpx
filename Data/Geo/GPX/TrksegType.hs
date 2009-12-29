-- | Complex Type: @trksegType@ <http://www.topografix.com/GPX/1/1/#type_trksegType>
module Data.Geo.GPX.TrksegType where

import Data.Geo.GPX.WptType
import Data.Geo.GPX.ExtensionsType
import Data.Geo.GPX.Accessor.Trkpts
import Data.Geo.GPX.Accessor.Extensions
import Text.XML.HXT.Arrow

data TrksegType = TrksegType [WptType] (Maybe ExtensionsType)
  deriving (Eq, Show)

trksegType :: [WptType] -- ^ The track points (trkpt).
              -> Maybe ExtensionsType -- ^ The extensions.
              -> TrksegType
trksegType = TrksegType

instance XmlPickler TrksegType where
  xpickle = xpWrap (\(trkpt', extensions') -> trksegType trkpt' extensions', \(TrksegType trkpt' extensions') -> (trkpt', extensions')) (xpPair
              (xpList (xpElem "trkpt" xpickle))
              (xpOption (xpElem "extensions" xpickle)))

instance Trkpts TrksegType where
  trkpts (TrksegType x _) = x

instance Extensions TrksegType where
  extensions (TrksegType _ x) = x
