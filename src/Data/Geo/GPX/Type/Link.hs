-- | Complex Type: @linkType@ <http://www.topografix.com/GPX/1/1/#type_linkType>
module Data.Geo.GPX.Type.Link(
  Link
, link
) where

import Data.Geo.GPX.Lens.HrefL
import Data.Geo.GPX.Lens.TextL
import Data.Geo.GPX.Lens.TypeL
import Data.Lens.Common
import Control.Comonad.Trans.Store
import Text.XML.HXT.Arrow.Pickle

data Link = Link String (Maybe String) (Maybe String)
  deriving (Eq, Ord)

link ::
  String -- ^ The href.
  -> Maybe String -- ^ The text.
  -> Maybe String -- ^ The type.
  -> Link
link =
  Link

instance HrefL Link where
  hrefL =
    Lens $ \(Link href text typ) -> store (\href -> Link href text typ) href

instance TextL Link where
  textL =
    Lens $ \(Link href text typ) -> store (\text -> Link href text typ) text

instance TypeL Link where
  typeL =
    Lens $ \(Link href text typ) -> store (\typ -> Link href text typ) typ

instance XmlPickler Link where
  xpickle =
    xpWrap (\(href, text, type') -> link href text type', \(Link href text type') -> (href, text, type')) (xpTriple
           (xpAttr "href" xpText)
           (xpOption (xpElem "text" xpText))
           (xpOption (xpElem "type" xpText)))

