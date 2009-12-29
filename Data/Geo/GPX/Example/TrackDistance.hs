-- Requires the Geodetic package
--   Home page: http://code.google.com/p/geodetic/
--   Hackage:   http://hackage.haskell.org/package/Geodetic

module Data.Geo.GPX.Example.TrackDistance where

import Control.Monad
import Control.Applicative
import Data.Geo hiding (lat, lon)
import Data.Geo.GPX

-- Computes the distance of tracks in a GPX file using Vincenty's inverse geodetic algorithm and prints out the name of the track and the result in metres.
filesDistance :: String -> IO [(Maybe String, Double)]
filesDistance = fmap distance . readGpxFile

distance :: [Gpx] -> [(Maybe String, Double)]
distance = fmap (name &&& foldl (\n (c, d) -> n + ellipsoidalDistance (inverse () c d)) 0 . ap zip tail .
             (uncurry (!.!) . latlon <$>) . (trkpts =<<) . trksegs) . (trks =<<)

k h = latlon h