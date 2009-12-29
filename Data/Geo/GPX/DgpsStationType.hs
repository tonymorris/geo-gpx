{-# LANGUAGE MultiParamTypeClasses #-}

-- | Simple Type: @dgpsStationType@ <http://www.topografix.com/GPX/1/1/#type_dgpsStationType>
module Data.Geo.GPX.DgpsStationType where

import Data.Geo.GPX.Accessor.Value
import Data.Ix
import Text.XML.HXT.Arrow

newtype DgpsStationType = DgpsStationType Int
  deriving Eq

dgpsStationType :: Int -- ^ The value between 0 and 1023.
                   -> Maybe DgpsStationType
dgpsStationType n = if inRange (0, 1023) n then Just (DgpsStationType n) else Nothing

instance Show DgpsStationType where
  show (DgpsStationType n) = show n

instance XmlPickler DgpsStationType where
  xpickle = xpWrapMaybe (dgpsStationType, \(DgpsStationType n) -> n) xpickle

instance Value DgpsStationType Int where
  value (DgpsStationType x) = x
