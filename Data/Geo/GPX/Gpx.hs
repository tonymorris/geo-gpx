{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances, GeneralizedNewtypeDeriving #-}

-- | Element: @gpx@ <http://www.topografix.com/GPX/1/1/#element_gpx>
module Data.Geo.GPX.Gpx(
                         Gpx,
                         gpx,
                         readGpxFile,
                         readGpxFiles
                       ) where

import Text.XML.HXT.Arrow
import Control.Monad
import Data.Geo.GPX.GpxType
import Data.Geo.GPX.PersonType
import Data.Geo.GPX.Accessor.Value
import Data.Geo.GPX.Accessor.Version
import Data.Geo.GPX.Accessor.Creator
import Data.Geo.GPX.Accessor.Metadata
import Data.Geo.GPX.Accessor.Wpts
import Data.Geo.GPX.Accessor.Rtes
import Data.Geo.GPX.Accessor.Trks
import Data.Geo.GPX.Accessor.Extensions
import Data.Geo.GPX.Accessor.Name
import Data.Geo.GPX.Accessor.Desc
import Data.Geo.GPX.Accessor.Author
import Data.Geo.GPX.Accessor.Copyright
import Data.Geo.GPX.Accessor.Links
import Data.Geo.GPX.Accessor.Time
import Data.Geo.GPX.Accessor.Keywords
import Data.Geo.GPX.Accessor.Bounds
import Data.Geo.GPX.Accessor.Rtepts
import Data.Geo.GPX.Accessor.Trkpts

newtype Gpx = Gpx GpxType
  deriving (Eq, Version, Creator, Metadata, Wpts, Rtes, Trks, Extensions, Name, Desc, Copyright, Links, Time, Keywords, Bounds, Rtepts, Trkpts)

instance Author Gpx (Maybe PersonType) where
  author = author . value
  setAuthor = (gpx .) . (. value) . setAuthor

gpx :: GpxType -- ^ The gpx element contents.
       -> Gpx
gpx = Gpx

instance Show Gpx where
  show (Gpx n) = show n

instance XmlPickler Gpx where
  xpickle = xpWrap (gpx, \(Gpx n) -> n) (xpElem "gpx" xpickle)

instance Value Gpx GpxType where
  value (Gpx x) = x
  setValue x (Gpx _) = gpx x

-- | Reads a GPX file into a list of @Gpx@ values removing whitespace.
readGpxFile :: FilePath -> IO [Gpx]
readGpxFile = runX . xunpickleDocument (xpickle :: PU Gpx) [(a_remove_whitespace, v_1)]

-- | Reads 0 or more GPX files into a list of @Gpx@ values removing whitespace.
readGpxFiles :: [FilePath] -> IO [Gpx]
readGpxFiles = fmap join . (mapM readGpxFile)
