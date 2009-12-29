-- Requires the Geodetic package
--   Home page: http://code.google.com/p/geodetic/
--   Hackage:   http://hackage.haskell.org/package/Geodetic

module Data.Geo.GPX.Example.TrackDistance where

import Text.XML.HXT.Arrow
import Control.Monad
import Control.Applicative
import Data.Geo hiding (lat, lon)
import Data.Geo.GPX

-- Computes the distance of tracks in a GPX file using Vincenty's inverse geodetic algorithm and prints out the name of the track and the result in metres.
filesDistance :: String -> IO [(Maybe String, Double)]
filesDistance = fmap distance . runX . xunpickleDocument (xpickle :: PU Gpx) [(a_remove_whitespace, v_1)]

distance :: [Gpx] -> [(Maybe String, Double)]
distance = fmap (\t -> let k = do a <- trksegs t
                                  b <- trkpts a
                                  return (value (lat b) !.! value (lon b))
                       in (name t, foldl (\n (c, d) -> n + ellipsoidalDistance (inverse () c d)) 0 (ap zip tail k))) . (trks =<<) . fmap value
