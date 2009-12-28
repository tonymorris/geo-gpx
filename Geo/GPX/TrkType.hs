module Geo.GPX.TrkType where

import Geo.GPX.TrksegType
import Geo.GPX.ExtensionsType
import Geo.GPX.LinkType
import Text.XML.HXT.Arrow

data TrkType = TrkType (Maybe String) (Maybe String) (Maybe String) [LinkType] (Maybe Int) (Maybe String) (Maybe ExtensionsType) [TrksegType]
  deriving (Eq, Show)

trkType :: Maybe String
           -> Maybe String
           -> Maybe String
           -> [LinkType]
           -> Maybe Int
           -> Maybe String
           -> Maybe ExtensionsType
           -> [TrksegType]
           -> TrkType
trkType a b c d e = TrkType a b c d (fmap abs e)

instance XmlPickler TrkType where
  xpickle = undefined
