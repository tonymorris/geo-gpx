module Geo.GPX.Wpt where

import Geo.GPX.Latitude
import Geo.GPX.Longitude
import Geo.GPX.Magvar
import Geo.GPX.Link
import Geo.GPX.Fix
import Geo.GPX.Dgpsid
import Geo.GPX.Extensions
import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow

data Wpt = Wpt Latitude
               Longitude
               (Maybe Double)
               (Maybe Magvar)
               (Maybe Double)
               (Maybe String)
               (Maybe String)
               (Maybe String)
               (Maybe String)
               [Link]
               (Maybe String)
               (Maybe String)
               (Maybe Fix)
               (Maybe Int)
               (Maybe Double)
               (Maybe Double)
               (Maybe Double)
               (Maybe Double)
               (Maybe Dgpsid)
               (Maybe Extensions)
  deriving Eq

wpt :: Latitude
    -> Longitude
    -> Maybe Double
    -> Maybe Magvar
    -> Maybe Double
    -> Maybe String
    -> Maybe String
    -> Maybe String
    -> Maybe String
    -> [Link]
    -> Maybe String
    -> Maybe String
    -> Maybe Fix
    -> Maybe Int
    -> Maybe Double
    -> Maybe Double
    -> Maybe Double
    -> Maybe Double
    -> Maybe Dgpsid
    -> Maybe Extensions
    -> Wpt
wpt a b c d e f g h i j k l m n o = Wpt a b c d e f g h i j k l m n (fmap abs o)

instance XmlPickler Wpt where
  xpickle = undefined

instance Show Wpt where
  show = showPickled []
