{-# LANGUAGE NoImplicitPrelude #-}

-- | Simple Type: @latitudeType@ <http://www.topografix.com/GPX/1/1/#type_latitudeType>
module Data.Geo.Gpx.Latitude (
  Latitude
, latitude
, xpLatAttr
, xpMinlatAttr
, xpMaxlatAttr
, xpLatitude
) where

import Text.XML.HXT.Core(XmlPickler(..), PU, xpAttr, xpWrapMaybe, xpPrim)
import Control.Lens(Prism', prism', (^?), (#))
import Prelude(Double, Maybe(..), Eq, Ord(..), Show, (&&))

-- $setup
-- >>> import Test.QuickCheck
-- >>> import Text.XML.HXT.Core
-- >>> import Prelude
-- >>> let unpickleLat p = fmap (unpickleDoc' p) . runLA xread
-- >>> newtype Alpha = Alpha Char
-- >>> instance Arbitrary Alpha where arbitrary = fmap Alpha (elements (['A'..'Z'] ++ ['a' .. 'z']))
-- >>> newtype Numeric = Numeric Char
-- >>> instance Arbitrary Numeric where arbitrary = fmap Numeric (elements ['0'..'9'])
-- >>> newtype Alphanumeric = Alphanumeric Char
-- >>> instance Arbitrary Alphanumeric where arbitrary = fmap Alphanumeric (oneof [fmap (\(Alpha c) -> c) arbitrary, fmap (\(Numeric c) -> c) arbitrary])
-- >>> newtype Element = Element String deriving Show
-- >>> instance Arbitrary Element where arbitrary = do Alpha c <- arbitrary; r <- listOf arbitrary; return (Element (c:fmap (\(Alphanumeric c) -> c) r))
newtype Latitude =
  Latitude Double
  deriving (Eq, Ord, Show)

-- | A prism to a value which will be between -90 and 90.
latitude ::
  Prism' Double Latitude -- ^ A prism to a value which will be between -90 and 90.
latitude =
  prism'
    (\(Latitude d) -> d)
    (\d -> if d >= -90 && d <= 90 then Just (Latitude d) else Nothing)

-- | Pickler for the @lat@ attribute.
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpLatAttr) ("<" ++ e ++" lat=\"0\"/>") == [Right (Latitude 0.0)]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpLatAttr) ("<" ++ e ++" lat=\"3\"/>") == [Right (Latitude 3.0)]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpLatAttr) ("<" ++ e ++" lat=\"-89\"/>") == [Right (Latitude (-89.0))]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpLatAttr) ("<" ++ e ++" lat=\"-90\"/>") == [Right (Latitude (-90.0))]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpLatAttr) ("<" ++ e ++" lat=\"89\"/>") == [Right (Latitude 89)]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpLatAttr) ("<" ++ e ++" lat=\"90\"/>") == [Right (Latitude 90)]
--
-- prop> \(Element e) -> all (either (const True) (const False)) (unpickleLat (xpElem e xpLatAttr) ("<" ++ e ++" lat=\"-91\"/>"))
--
-- prop> \(Element e) -> all (either (const True) (const False)) (unpickleLat (xpElem e xpLatAttr) ("<" ++ e ++" lat=\"91\"/>"))
xpLatAttr ::
  PU Latitude
xpLatAttr =
  xpAttr "lat"
    xpLatitude

-- | Pickler for the @minlat@ attribute.
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpMinlatAttr) ("<" ++ e ++" minlat=\"0\"/>") == [Right (Latitude 0.0)]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpMinlatAttr) ("<" ++ e ++" minlat=\"3\"/>") == [Right (Latitude 3.0)]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpMinlatAttr) ("<" ++ e ++" minlat=\"-89\"/>") == [Right (Latitude (-89.0))]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpMinlatAttr) ("<" ++ e ++" minlat=\"-90\"/>") == [Right (Latitude (-90.0))]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpMinlatAttr) ("<" ++ e ++" minlat=\"89\"/>") == [Right (Latitude 89)]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpMinlatAttr) ("<" ++ e ++" minlat=\"90\"/>") == [Right (Latitude 90)]
--
-- prop> \(Element e) -> all (either (const True) (const False)) (unpickleLat (xpElem e xpMinlatAttr) ("<" ++ e ++" minlat=\"-91\"/>"))
--
-- prop> \(Element e) -> all (either (const True) (const False)) (unpickleLat (xpElem e xpMinlatAttr) ("<" ++ e ++" minlat=\"91\"/>"))
xpMinlatAttr ::
  PU Latitude
xpMinlatAttr =
  xpAttr "minlat"
    xpLatitude


-- | Pickler for the @maxlat@ attribute.
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpMaxlatAttr) ("<" ++ e ++" maxlat=\"0\"/>") == [Right (Latitude 0.0)]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpMaxlatAttr) ("<" ++ e ++" maxlat=\"3\"/>") == [Right (Latitude 3.0)]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpMaxlatAttr) ("<" ++ e ++" maxlat=\"-89\"/>") == [Right (Latitude (-89.0))]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpMaxlatAttr) ("<" ++ e ++" maxlat=\"-90\"/>") == [Right (Latitude (-90.0))]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpMaxlatAttr) ("<" ++ e ++" maxlat=\"89\"/>") == [Right (Latitude 89)]
--
-- prop> \(Element e) -> unpickleLat (xpElem e xpMaxlatAttr) ("<" ++ e ++" maxlat=\"90\"/>") == [Right (Latitude 90)]
--
-- prop> \(Element e) -> all (either (const True) (const False)) (unpickleLat (xpElem e xpMaxlatAttr) ("<" ++ e ++" maxlat=\"-91\"/>"))
--
-- prop> \(Element e) -> all (either (const True) (const False)) (unpickleLat (xpElem e xpMaxlatAttr) ("<" ++ e ++" maxlat=\"91\"/>"))
xpMaxlatAttr ::
  PU Latitude
xpMaxlatAttr =
  xpAttr "maxlat"
    xpLatitude

-- | Pickler for the @Latitude@ type.
xpLatitude ::
  PU Latitude
xpLatitude =
  xpWrapMaybe ((^? latitude), (#) latitude) xpPrim

instance XmlPickler Latitude where
  xpickle =
    xpLatitude
