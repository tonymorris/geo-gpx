module Geo.GPX.Trk where

import Geo.GPX.Trkseg
import Geo.GPX.Extensions
import Geo.GPX.Link
import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow

data Trk = Trk (Maybe String) (Maybe String) (Maybe String) [Link] (Maybe Int) (Maybe String) (Maybe Extensions) [Trkseg]
  deriving Eq

trk :: Maybe String
    -> Maybe String
    -> Maybe String
    -> [Link]
    -> Maybe Int
    -> Maybe String
    -> Maybe Extensions
    -> [Trkseg]
    -> Trk
trk a b c d e = Trk a b c d (fmap abs e)

instance XmlPickler Trk where
  xpickle = undefined

instance Show Trk where
  show = showPickled []
