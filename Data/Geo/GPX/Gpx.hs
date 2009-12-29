{-# LANGUAGE MultiParamTypeClasses #-}

-- | Element: @gpx@ <http://www.topografix.com/GPX/1/1/#element_gpx>
module Data.Geo.GPX.Gpx(
                         Gpx,
                         gpx,
                         readGpxFile
                       ) where

import Text.XML.HXT.Arrow
import Data.Geo.GPX.GpxType
import Data.Geo.GPX.Accessor.Value

newtype Gpx = Gpx GpxType
  deriving Eq

gpx :: GpxType -- ^ The gpx element contents.
       -> Gpx
gpx = Gpx

instance Show Gpx where
  show (Gpx n) = show n

instance XmlPickler Gpx where
  xpickle = xpWrap (gpx, \(Gpx n) -> n) (xpElem "gpx" xpickle)

instance Value Gpx GpxType where
  value (Gpx x) = x

-- | Reads a GPX file into a list of @Gpx@ values removing whitespace.
readGpxFile :: FilePath -> IO [Gpx]
readGpxFile = runX . xunpickleDocument (xpickle :: PU Gpx) [(a_remove_whitespace, v_1)]
