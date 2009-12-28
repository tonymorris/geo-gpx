module Data.Geo.GPX.RteType where

import Data.Geo.GPX.WptType
import Data.Geo.GPX.ExtensionsType
import Data.Geo.GPX.LinkType
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras

data RteType = RteType (Maybe String) (Maybe String) (Maybe String) (Maybe String) [LinkType] (Maybe Int) (Maybe String) (Maybe ExtensionsType) [WptType]
  deriving (Eq, Show)

rteType :: Maybe String
           -> Maybe String
           -> Maybe String
           -> Maybe String
           -> [LinkType]
           -> Maybe Int
           -> Maybe String
           -> Maybe ExtensionsType
           -> [WptType]
           -> RteType
rteType a b c d e f = RteType a b c d e (fmap abs f)

instance XmlPickler RteType where
  xpickle = xpWrap (\(a, b, c, d, e, f, g, h, i) -> rteType a b c d e f g h i, \(RteType a b c d e f g h i) -> (a, b, c, d, e, f, g, h, i)) (xp9Tuple
              (xpOption (xpElem "name" xpText))
              (xpOption (xpElem "cmt" xpText))
              (xpOption (xpElem "desc" xpText))
              (xpOption (xpElem "src" xpText))
              (xpList (xpElem "link" xpickle))
              (xpOption (xpElem "number" xpPrim))
              (xpOption (xpElem "type" xpText))
              (xpOption (xpElem "extensions" xpickle))
              (xpList (xpElem "rtept" xpickle)))
