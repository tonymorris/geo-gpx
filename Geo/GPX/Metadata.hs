module Geo.GPX.Metadata where

import Geo.GPX.Person
import Geo.GPX.Copyright
import Geo.GPX.Link
import Geo.GPX.Bounds
import Geo.GPX.Extensions
import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow

data Metadata = Metadata (Maybe String) (Maybe String) (Maybe Person) (Maybe Copyright) [Link] (Maybe String) (Maybe String) (Maybe Bounds) (Maybe Extensions)
  deriving Eq

metadata :: Maybe String
            -> Maybe String
            -> Maybe Person
            -> Maybe Copyright
            -> [Link]
            -> Maybe String
            -> Maybe String
            -> Maybe Bounds
            -> Maybe Extensions
            -> Metadata
metadata = Metadata

instance XmlPickler Metadata where
  xpickle = undefined

instance Show Metadata where
  show = showPickled []
