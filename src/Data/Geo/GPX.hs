{-# LANGUAGE MultiParamTypeClasses #-}

-- | GPX 1.1 Schema <http://www.topografix.com/GPX/1/1/>
module Data.Geo.GPX(
  module Data.Geo.GPX.Type
, module Data.Geo.GPX.Lens
, module Control.Arrow
, GPX
) where

import Data.Geo.GPX.Type
import Data.Geo.GPX.Lens
import Control.Arrow
import Text.XML.HXT.Arrow.Pickle
import Control.Newtype
import Data.Lens.Common
import Control.Comonad.Trans.Store

-- | Top-level GPX data type with the root XML element applied.
newtype GPX = GPX Gpx
  deriving Eq

instance XmlPickler GPX where
  xpickle = xpWrap (GPX, \(GPX g) -> g) (xpElem "gpx" xpickle)

instance GpxP GPX where
  gpx v c m w r t e =
    GPX (gpx v c m w r t e)
    
instance Newtype GPX Gpx where
  pack = 
    GPX
  unpack (GPX x) =
    x

instance VersionL GPX where
  versionL =
    newtypeLens >>> versionL

instance CreatorL GPX where
  creatorL =
    newtypeLens >>> creatorL

instance MetadataL GPX where
  metadataL =
    newtypeLens >>> metadataL

instance WptsL GPX where
  wptsL =
    newtypeLens >>> wptsL

instance RtesL GPX where
  rtesL =
    newtypeLens >>> rtesL

instance TrksL GPX where
  trksL =
    newtypeLens >>> trksL

instance ExtensionsL GPX where
  extensionsL =
    newtypeLens >>> extensionsL

-- not exported (belongs in data-lens)
newtypeLens ::
  Lens GPX Gpx
newtypeLens =
  Lens (store pack . unpack)

