-- | Reversing element lists of a GPX files.
module Data.Geo.GPX.Util.Reverse(
                                  reverseRtes,
                                  reverseTrks,
                                  reverseTrksegs,
                                  reverseWpts,
                                  reverseConservingTime
                                ) where

import Data.Geo.GPX.Accessor.Trks
import Data.Geo.GPX.Accessor.Trkpts
import Data.Geo.GPX.Accessor.Trksegs
import Data.Geo.GPX.Accessor.Wpts
import Data.Geo.GPX.Accessor.Rtes
import Data.Geo.GPX.Accessor.Rtepts
import Data.Geo.GPX.Accessor.Time
import Control.Applicative

-- | Reverses a list of routes (rte).
reverseRtes :: (Rtes a) =>
               a
               -> a
reverseRtes = usingRtes (map (usingRtepts reverse) . reverse)

-- | Reverses a list of tracks (trk).
reverseTrks :: (Trks a) =>
               a
               -> a
reverseTrks = usingTrks (map reverseTrksegs . reverse)

-- | Reverses a list of track segments (trkseg).
reverseTrksegs :: (Trksegs a) =>
                  a
                  -> a
reverseTrksegs = usingTrksegs (map (usingTrkpts reverse) . reverse)

-- | Reverses a list of waypoints (wpt).
reverseWpts :: (Wpts a) =>
               a
               -> a
reverseWpts = usingWpts reverse

-- | Reverses a list of elements with a time, however, the time is not reversed.
reverseConservingTime :: (Time a) =>
                         [a]
                         -> [a]
reverseConservingTime = zipWith setTime . map time <*> reverse
