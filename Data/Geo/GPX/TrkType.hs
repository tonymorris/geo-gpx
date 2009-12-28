module Data.Geo.GPX.TrkType where

import Data.Geo.GPX.TrksegType
import Data.Geo.GPX.ExtensionsType
import Data.Geo.GPX.LinkType
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras

data TrkType = TrkType (Maybe String) (Maybe String) (Maybe String) (Maybe String) [LinkType] (Maybe Int) (Maybe String) (Maybe ExtensionsType) [TrksegType]
  deriving (Eq, Show)

trkType :: Maybe String
           -> Maybe String
           -> Maybe String
           -> Maybe String
           -> [LinkType]
           -> Maybe Int
           -> Maybe String
           -> Maybe ExtensionsType
           -> [TrksegType]
           -> TrkType
trkType a b c d e f = TrkType a b c d e (fmap abs f)

instance XmlPickler TrkType where
  xpickle = xpWrap (\(a, b, c, d, e, f, g, h, i) -> trkType a b c d e f g h i, \(TrkType a b c d e f g h i) -> (a, b, c, d, e, f, g, h, i)) (xp9Tuple
              (xpOption (xpElem "name" xpText))
              (xpOption (xpElem "cmt" xpText))
              (xpOption (xpElem "desc" xpText))
              (xpOption (xpElem "src" xpText))
              (xpList (xpElem "link" xpickle))
              (xpOption (xpElem "number" xpPrim))
              (xpOption (xpElem "type" xpText))
              (xpOption (xpElem "extensions" xpickle))
              (xpList (xpElem "trkseg" xpickle)))
