{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances  #-}

-- | Complex Type: @gpxType@ <http://www.topografix.com/GPX/1/1/#type_gpxType>
module Data.Geo.GPX.Gpx(
  Gpx
, gpx
) where

import Data.Geo.GPX.Metadata
import Data.Geo.GPX.Wpt
import Data.Geo.GPX.Rte
import Data.Geo.GPX.Trk
import Data.Geo.GPX.Extensions
import Data.Geo.GPX.Person
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras
import Data.Maybe

data Gpx = Gpx String String (Maybe Metadata) [Wpt] [Rte] [Trk] (Maybe Extensions)
  deriving (Eq, Ord)

gpx ::
  String -- ^ The version.
  -> String -- ^ The creator.
  -> Maybe Metadata -- ^ The metadata.
  -> [Wpt] -- ^ The waypoints (wpt).
  -> [Rte] -- ^ The routes (rte).
  -> [Trk] -- ^ The tracks (trk).
  -> Maybe Extensions -- ^ The extensions.
  -> Gpx
gpx =
  Gpx

