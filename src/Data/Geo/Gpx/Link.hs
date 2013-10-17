-- | Complex Type: @linkType@ <http://www.topografix.com/GPX/1/1/#type_linkType>
module Data.Geo.Gpx.Link(
  Link
, link
) where


data Link = Link String (Maybe String) (Maybe String)
  deriving (Eq, Ord)

link ::
  String -- ^ The href.
  -> Maybe String -- ^ The text.
  -> Maybe String -- ^ The type.
  -> Link
link =
  Link

{-
instance HrefL Link where
  hrefL =
    Lens $ \(Link href text typ) -> store (\href -> Link href text typ) href

instance TextL Link where
  textL =
    Lens $ \(Link href text typ) -> store (\text -> Link href text typ) text

instance TypeL Link where
  typeL =
    Lens $ \(Link href text typ) -> store (\typ -> Link href text typ) typ
-}

{-
instance XmlPickler Link where
  xpickle =
    xpWrap (\(href, text, type') -> link href text type', \(Link href text type') -> (href, text, type')) (xpTriple
           (xpAttr "href" xpText)
           (xpOption (xpElem "text" xpText))
           (xpOption (xpElem "type" xpText)))
-}
