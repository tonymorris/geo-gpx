-- | Complex Type: @extensionsType@ <http://www.topografix.com/GPX/1/1/#type_extensionsType>
module Data.Geo.GPX.Extensions(
  Extensions
, extensions
, runExtensions
) where

import Text.XML.HXT.Arrow.Pickle
import Text.XML.HXT.DOM.TypeDefs

newtype Extensions = Extensions XmlTrees
  deriving Eq

extensions :: 
  XmlTrees
  -> Extensions
extensions =
  Extensions

runExtensions ::
  Extensions
  -> XmlTrees
runExtensions (Extensions t) =
  t

instance XmlPickler Extensions where
  xpickle =
    xpWrap (Extensions, \(Extensions t) -> t) xpTrees

