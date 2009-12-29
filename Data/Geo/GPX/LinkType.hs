-- | Complex Type: @linkType@ <http://www.topografix.com/GPX/1/1/#type_linkType>
module Data.Geo.GPX.LinkType where

import Text.XML.HXT.Arrow

data LinkType = LinkType String (Maybe String) (Maybe String)
  deriving (Eq, Show)

linkType :: String -- ^ The href.
            -> Maybe String -- ^ The text.
            -> Maybe String -- ^ The type.
            -> LinkType
linkType = LinkType

instance XmlPickler LinkType where
  xpickle = xpWrap (\(href, text, type') -> linkType href text type', \(LinkType href text type') -> (href, text, type')) (xpTriple
              (xpAttr "href" xpText)
              (xpOption (xpElem "text" xpText))
              (xpOption (xpElem "type" xpText)))
