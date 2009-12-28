{-# LANGUAGE MultiParamTypeClasses #-}

module Data.Geo.GPX.Gpx where

import Text.XML.HXT.Arrow
import Data.Geo.GPX.GpxType
import Data.Geo.GPX.Accessor.Value

newtype Gpx = Gpx GpxType
  deriving Eq

gpx :: GpxType -> Gpx
gpx = Gpx

instance Show Gpx where
  show (Gpx n) = show n

instance XmlPickler Gpx where
  xpickle = xpWrap (gpx, \(Gpx n) -> n) (xpElem "gpx" xpickle)

instance Value Gpx GpxType where
  value (Gpx x) = x
