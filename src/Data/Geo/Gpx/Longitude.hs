{-# LANGUAGE NoImplicitPrelude #-}

-- | Simple Type: @longitudeType@ <http://www.topografix.com/GPX/1/1/#type_longitudeType>
module Data.Geo.Gpx.Longitude (
  Longitude
, longitude
, xpLonAttr
, xpMinlonAttr
, xpMaxlonAttr
, xpLongitude
) where

import Text.XML.HXT.Core(XmlPickler(..), PU, xpAttr, xpWrapMaybe, xpPrim)
import Control.Lens(Prism', prism', (^?), (#))
import Prelude(Double, Maybe(..), Eq, Ord(..), Show, (&&))

-- $setup
-- >>> import Test.QuickCheck
-- >>> import Text.XML.HXT.Core
-- >>> import Prelude
-- >>> let unpickleLon p = fmap (unpickleDoc' p) . runLA xread
-- >>> newtype Alpha = Alpha Char
-- >>> instance Arbitrary Alpha where arbitrary = fmap Alpha (elements (['A'..'Z'] ++ ['a' .. 'z']))
-- >>> newtype Numeric = Numeric Char
-- >>> instance Arbitrary Numeric where arbitrary = fmap Numeric (elements ['0'..'9'])
-- >>> newtype Alphanumeric = Alphanumeric Char
-- >>> instance Arbitrary Alphanumeric where arbitrary = fmap Alphanumeric (oneof [fmap (\(Alpha c) -> c) arbitrary, fmap (\(Numeric c) -> c) arbitrary])
-- >>> newtype Element = Element String deriving Show
-- >>> instance Arbitrary Element where arbitrary = do Alpha c <- arbitrary; r <- listOf arbitrary; return (Element (c:fmap (\(Alphanumeric c) -> c) r))
newtype Longitude =
  Longitude Double
  deriving (Eq, Ord, Show)

-- | A prism to a value which will be between -180 and 180.
longitude ::
  Prism' Double Longitude -- ^ A prism to a value which will be between -180 and 180.
longitude =
  prism'
    (\(Longitude d) -> d)
    (\d -> if d >= -180 && d <= 180 then Just (Longitude d) else Nothing)

-- | Pickler for the @lon@ attribute.
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpLonAttr) ("<" ++ e ++" lon=\"0\"/>") == [Right (Longitude 0.0)]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpLonAttr) ("<" ++ e ++" lon=\"3\"/>") == [Right (Longitude 3.0)]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpLonAttr) ("<" ++ e ++" lon=\"-179\"/>") == [Right (Longitude (-179.0))]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpLonAttr) ("<" ++ e ++" lon=\"-180\"/>") == [Right (Longitude (-180.0))]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpLonAttr) ("<" ++ e ++" v=\"179\"/>") == [Right (Longitude 179)]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpLonAttr) ("<" ++ e ++" lon=\"180\"/>") == [Right (Longitude 180)]
--
-- prop> \(Element e) -> all (either (const True) (const False)) (unpickleLon (xpElem e xpLonAttr) ("<" ++ e ++" lon=\"-181\"/>"))
--
-- prop> \(Element e) -> all (either (const True) (const False)) (unpickleLon (xpElem e xpLonAttr) ("<" ++ e ++" lon=\"181\"/>"))
xpLonAttr ::
  PU Longitude
xpLonAttr =
  xpAttr "lon"
    xpLongitude

-- | Pickler for the @minlon@ attribute.
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpMinlonAttr) ("<" ++ e ++" minlon=\"0\"/>") == [Right (Longitude 0.0)]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpMinlonAttr) ("<" ++ e ++" minlon=\"3\"/>") == [Right (Longitude 3.0)]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpMinlonAttr) ("<" ++ e ++" minlon=\"-179\"/>") == [Right (Longitude (-179.0))]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpMinlonAttr) ("<" ++ e ++" minlon=\"-180\"/>") == [Right (Longitude (-180.0))]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpMinlonAttr) ("<" ++ e ++" minlon=\"179\"/>") == [Right (Longitude 179)]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpMinlonAttr) ("<" ++ e ++" minlon=\"180\"/>") == [Right (Longitude 180)]
--
-- prop> \(Element e) -> all (either (const True) (const False)) (unpickleLon (xpElem e xpMinlonAttr) ("<" ++ e ++" minlon=\"-181\"/>"))
--
-- prop> \(Element e) -> all (either (const True) (const False)) (unpickleLon (xpElem e xpMinlonAttr) ("<" ++ e ++" minlon=\"181\"/>"))
xpMinlonAttr ::
  PU Longitude
xpMinlonAttr =
  xpAttr "minlon"
    xpLongitude


-- | Pickler for the @maxlon@ attribute.
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpMaxlonAttr) ("<" ++ e ++" maxlon=\"0\"/>") == [Right (Longitude 0.0)]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpMaxlonAttr) ("<" ++ e ++" maxlon=\"3\"/>") == [Right (Longitude 3.0)]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpMaxlonAttr) ("<" ++ e ++" maxlon=\"-179\"/>") == [Right (Longitude (-179.0))]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpMaxlonAttr) ("<" ++ e ++" maxlon=\"-180\"/>") == [Right (Longitude (-180.0))]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpMaxlonAttr) ("<" ++ e ++" maxlon=\"179\"/>") == [Right (Longitude 179)]
--
-- prop> \(Element e) -> unpickleLon (xpElem e xpMaxlonAttr) ("<" ++ e ++" maxlon=\"180\"/>") == [Right (Longitude 180)]
--
-- prop> \(Element e) -> all (either (const True) (const False)) (unpickleLon (xpElem e xpMaxlonAttr) ("<" ++ e ++" maxlon=\"-181\"/>"))
--
-- prop> \(Element e) -> all (either (const True) (const False)) (unpickleLon (xpElem e xpMaxlonAttr) ("<" ++ e ++" maxlon=\"181\"/>"))
xpMaxlonAttr ::
  PU Longitude
xpMaxlonAttr =
  xpAttr "maxlon"
    xpLongitude

-- | Pickler for the @Longitude@ type.
xpLongitude ::
  PU Longitude
xpLongitude =
  xpWrapMaybe ((^? longitude), (#) longitude) xpPrim

instance XmlPickler Longitude where
  xpickle =
    xpLongitude
