-- | Complex Type: @extensionsType@ <http://www.topografix.com/GPX/1/1/#type_extensionsType>
module Data.Geo.GPX.Extensions(
  Extensions
, extensions
, runExtensions
) where

import Text.XML.HXT.Arrow

newtype Extensions = Extensions XmlTree
  deriving (Eq, Ord)

extensions :: 
  XmlTree
  -> Extensions
extensions =
  Extensions

runExtensions ::
  Extensions
  -> XmlTree
runExtensions (Extensions t) =
  t

instance XmlPickler Extensions where
  xpickle =
    xpWrap (Extensions, \(Extensions t) -> t) xpTree

