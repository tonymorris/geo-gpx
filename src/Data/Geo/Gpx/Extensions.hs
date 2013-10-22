{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoImplicitPrelude #-}

-- | Complex Type: @extensionsType@ <http://www.topografix.com/GPX/1/1/#type_extensionsType>
module Data.Geo.Gpx.Extensions(
  Extensions
, extensions
, xpExtensionsElem
, xpExtensions
) where

import Text.XML.HXT.Core(XmlPickler(..), PU, xpWrap, xpTrees, xpElem)
import Text.XML.HXT.DOM.TypeDefs(XmlTrees)
import Control.Lens(makeIso)
import Prelude(Eq, Show)

-- $setup
-- >>> import Prelude
-- >>> import Text.XML.HXT.Core
-- >>> let unpickleExtensionsElem = fmap (unpickleDoc' xpExtensionsElem) . runLA xread
-- >>> let allUnpickledExtensionsElem = all (either (const False) (const True) . unpickleDoc' xpExtensionsElem) . runLA xread

newtype Extensions = Extensions XmlTrees
  deriving (Eq, Show)

-- | Pickler for the @extensions@ element.
--
-- >>> unpickleExtensionsElem "<extensions><ext>abc</ext></extensions>"
-- [Right (Extensions [NTree (XTag "ext" []) [NTree (XText "abc") []]])]
--
-- >>> allUnpickledExtensionsElem "<e><ext>abc</ext></e>"
-- False
xpExtensionsElem ::
  PU Extensions
xpExtensionsElem =
  xpElem "extensions"
    xpExtensions

-- | Pickler for the @Extensions@ type.
xpExtensions ::
  PU Extensions
xpExtensions =
  xpWrap (Extensions, \(Extensions t) -> t) xpTrees

instance XmlPickler Extensions where
  xpickle =
    xpExtensions

makeIso ''Extensions
