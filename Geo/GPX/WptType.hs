module Geo.GPX.WptType where

import Geo.GPX.LatitudeType
import Geo.GPX.LongitudeType
import Geo.GPX.DegreesType
import Geo.GPX.LinkType
import Geo.GPX.FixType
import Geo.GPX.DgpsStationType
import Geo.GPX.ExtensionsType
import Text.XML.HXT.Arrow

data WptType = WptType LatitudeType
                       LongitudeType
                       (Maybe Double)
                       (Maybe DegreesType)
                       (Maybe Double)
                       (Maybe String)
                       (Maybe String)
                       (Maybe String)
                       (Maybe String)
                       [LinkType]
                       (Maybe String)
                       (Maybe String)
                       (Maybe FixType)
                       (Maybe Int)
                       (Maybe Double)
                       (Maybe Double)
                       (Maybe Double)
                       (Maybe Double)
                       (Maybe DgpsStationType)
                       (Maybe ExtensionsType)
  deriving (Eq, Show)

wptType :: LatitudeType
           -> LongitudeType
           -> Maybe Double
           -> Maybe DegreesType
           -> Maybe Double
           -> Maybe String
           -> Maybe String
           -> Maybe String
           -> Maybe String
           -> [LinkType]
           -> Maybe String
           -> Maybe String
           -> Maybe FixType
           -> Maybe Int
           -> Maybe Double
           -> Maybe Double
           -> Maybe Double
           -> Maybe Double
           -> Maybe DgpsStationType
           -> Maybe ExtensionsType
           -> WptType
wptType a b c d e f g h i j k l m n o = WptType a b c d e f g h i j k l m n (fmap abs o)

instance XmlPickler WptType where
  xpickle = undefined
