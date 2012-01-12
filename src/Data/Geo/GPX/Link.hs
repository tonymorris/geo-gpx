-- | Complex Type: @linkType@ <http://www.topografix.com/GPX/1/1/#type_linkType>
module Data.Geo.GPX.Link(
  Link
, link
) where

import Text.XML.HXT.Arrow

data Link = Link String (Maybe String) (Maybe String)
  deriving (Eq, Ord)

link ::
  String -- ^ The href.
  -> Maybe String -- ^ The text.
  -> Maybe String -- ^ The type.
  -> Link
link =
  Link

