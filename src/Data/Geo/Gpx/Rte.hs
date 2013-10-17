-- | Complex Type: @rteType@ <http://www.topografix.com/GPX/1/1/#type_rteType>
module Data.Geo.Gpx.Rte(
  Rte
, rte
) where

import Data.Geo.Gpx.Wpt
import Data.Geo.Gpx.Extensions
import Data.Geo.Gpx.Link

data Rte = Rte (Maybe String) (Maybe String) (Maybe String) (Maybe String) [Link] (Maybe Int) (Maybe String) (Maybe Extensions) [Wpt]
  deriving Eq

rte ::
  Maybe String -- ^ The name.
  -> Maybe String -- ^ The cmt.
  -> Maybe String -- ^ The desc.
  -> Maybe String -- ^ The src.
  -> [Link] -- ^ The links (link).
  -> Maybe Int -- ^ The number.
  -> Maybe String -- ^ The type.
  -> Maybe Extensions -- ^ The extensions.
  -> [Wpt] -- ^ The route points (rtept).
  -> Rte
rte a b c d e f =
  Rte a b c d e (fmap abs f)

{-
instance NameL Rte where
  nameL =
    Lens $ \(Rte name cmt desc src links number typ extensions rtepts) -> store (\name -> Rte name cmt desc src links number typ extensions rtepts) name

instance CmtL Rte where
  cmtL =
    Lens $ \(Rte name cmt desc src links number typ extensions rtepts) -> store (\cmt -> Rte name cmt desc src links number typ extensions rtepts) cmt

instance DescL Rte where
  descL =
    Lens $ \(Rte name cmt desc src links number typ extensions rtepts) -> store (\desc -> Rte name cmt desc src links number typ extensions rtepts) desc

instance SrcL Rte where
  srcL =
    Lens $ \(Rte name cmt desc src links number typ extensions rtepts) -> store (\src -> Rte name cmt desc src links number typ extensions rtepts) src

instance LinksL Rte where
  linksL =
    Lens $ \(Rte name cmt desc src links number typ extensions rtepts) -> store (\links -> Rte name cmt desc src links number typ extensions rtepts) links

instance NumberL Rte where
  numberL =
    Lens $ \(Rte name cmt desc src links number typ extensions rtepts) -> store (\number -> Rte name cmt desc src links number typ extensions rtepts) number

instance TypeL Rte where
  typeL =
    Lens $ \(Rte name cmt desc src links number typ extensions rtepts) -> store (\typ -> Rte name cmt desc src links number typ extensions rtepts) typ

instance ExtensionsL Rte where
  extensionsL =
    Lens $ \(Rte name cmt desc src links number typ extensions rtepts) -> store (\extensions -> Rte name cmt desc src links number typ extensions rtepts) extensions

instance RteptsL Rte where
  rteptsL =
    Lens $ \(Rte name cmt desc src links number typ extensions rtepts) -> store (\rtepts -> Rte name cmt desc src links number typ extensions rtepts) rtepts
-}

{-
instance XmlPickler Rte where
  xpickle =
    xpWrap (\(a, b, c, d, e, f, g, h, i) -> rte a b c d e f g h i, \(Rte a b c d e f g h i) -> (a, b, c, d, e, f, g, h, i)) (xp9Tuple
           (xpOption (xpElem "name" xpText))
           (xpOption (xpElem "cmt" xpText))
           (xpOption (xpElem "desc" xpText))
           (xpOption (xpElem "src" xpText))
           (xpList (xpElem "link" xpickle))
           (xpOption (xpElem "number" xpPrim))
           (xpOption (xpElem "type" xpText))
           (xpOption (xpElem "extensions" xpickle))
           (xpList (xpElem "rtept" xpickle)))
-}
