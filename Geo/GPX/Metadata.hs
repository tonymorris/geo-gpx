module Geo.GPX.Metadata where

import Geo.GPX.Person
import Geo.GPX.Copyright
import Geo.GPX.Link
import Geo.GPX.Bounds
import Geo.GPX.Extensions

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
