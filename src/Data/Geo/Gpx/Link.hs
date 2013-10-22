{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoImplicitPrelude #-}

-- | Complex Type: @linkType@ <http://www.topografix.com/GPX/1/1/#type_linkType>
module Data.Geo.Gpx.Link(
  Link
, HasLink(..)
, xpLinkElem
, xpLink
, link'
, href'
, text'
, tyype'
) where

import Text.XML.HXT.Core(XmlPickler(..), PU, xpAttr, xpElem, xpText0, xpOption, xpWrap, xpTriple)
import Control.Lens(makeClassy, Prism', prism')
import Prelude(Eq, Ord, Show, String, Maybe(..), fmap)
import Control.Applicative((<$), (<$>), Applicative(..))

-- $setup
-- >>> import Prelude
-- >>> import Text.XML.HXT.Core
-- >>> let unpickleLinkElem = fmap (unpickleDoc' xpLinkElem) . runLA xread
-- >>> let allUnpickledLinkElem = all (either (const False) (const True) . unpickleDoc' xpLinkElem) . runLA xread

data Link =
  Link {
    _href :: String
  , _text :: Maybe String
  , _tyype :: Maybe String
  } deriving (Eq, Ord, Show)

href' ::
  Prism' Link String
href' =
  prism'
    (\h -> Link h Nothing Nothing)
    (\(Link h t y) -> h <$ t <* y)

text' ::
  Prism' Link (String, String, Maybe String)
text' =
  prism'
    (\(h, t, y) -> Link h (Just t) y)
    (\(Link h t y) -> fmap (\t' -> (h, t', y)) t)

tyype' ::
  Prism' Link (String, Maybe String, String)
tyype' =
  prism'
    (\(h, t, y) -> Link h t (Just y))
    (\(Link h t y) -> fmap (\y' -> (h, t, y')) y)

link' ::
  Prism' Link (String, String, String)
link' =
  prism'
    (\(h, t, y) -> Link h (Just t) (Just y))
    (\(Link h t y) -> (\t' y' -> (h, t', y')) <$> t <*> y)

-- | Pickler for the @link@ element.
--
-- todo re-enable tests https://github.com/sol/doctest-haskell/issues/66
-- >> unpickleLinkElem "<link href=\"the href\"><text>the text</text><type>the type</type></link>"
-- [Right (Link {_href = "the href", _text = Just "the text", _tyype = Just "the type"})]
--
-- >> allUnpickledLinkElem "<link><text>2010</text><type>the type</type></link>"
-- False
--
-- >> unpickleLinkElem "<link href=\"the href\"><text>the text</text></link>"
-- [Right (Link {_href = "the href", _text = Just "the text", _tyype = Nothing})]
--
-- >> unpickleLinkElem "<link href=\"the href\"><type>the type</type></link>"
-- [Right (Link {_href = "the href", _text = Nothing, _tyype = Just "the type"})]
--
-- >> unpickleLinkElem "<link href=\"the href\"></link>"
-- [Right (Link {_href = "the href", _text = Nothing, _tyype = Nothing})]
--
-- >> unpickleLinkElem "<link href=\"\"><text>the text</text><type>the type</type></link>"
-- [Right (Link {_href = "", _text = Just "the text", _tyype = Just "the type"})]
--
-- >> unpickleLinkElem "<link href=\"the href\"><text></text><type>the type</type></link>"
-- [Right (Link {_href = "the href", _text = Just "", _tyype = Just "the type"})]
--
-- >> unpickleLinkElem "<link href=\"the href\"><text>the text</text><type></type></link>"
-- [Right (Link {_href = "the href", _text = Just "the text", _tyype = Just ""})]
--
-- >> allUnpickledLinkElem "<link href=\"the href\"><x>x</x></link>"
-- False
--
-- >> allUnpickledLinkElem "<c href=\"the href\"><text>the text</text></c>"
-- False
xpLinkElem ::
  PU Link
xpLinkElem =
  xpElem "link"
    xpLink

-- | Pickler for the @Link@ type.
xpLink ::
  PU Link
xpLink =
  xpWrap (\(h, t, y) -> Link h t y, \(Link h t y) -> (h, t, y))
    (xpTriple
       (xpAttr "href" xpText0)
       (xpOption (xpElem "text" xpText0))
       (xpOption (xpElem "type" xpText0)))

instance XmlPickler Link where
  xpickle =
    xpLink

makeClassy ''Link
