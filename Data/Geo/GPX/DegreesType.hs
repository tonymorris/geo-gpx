{-# LANGUAGE MultiParamTypeClasses #-}

module Data.Geo.GPX.DegreesType where

import Data.Geo.GPX.Accessor.Value
import Data.Fixed
import Text.XML.HXT.Arrow

newtype DegreesType = DegreesType Double
  deriving (Eq, Show)

degreesType :: Double -> DegreesType
degreesType n = DegreesType (n `mod'` 360)

instance XmlPickler DegreesType where
  xpickle = xpWrap (degreesType, \(DegreesType n) -> n) xpPrim

instance Value DegreesType Double where
  value (DegreesType x) = x
