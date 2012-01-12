-- | Utility functions for removing elements of GPX files.
module Data.Geo.GPX.Util.Remove(
                                 removeWpts,
                                 removeTrks,
                                 removeRtes,
                                 removeMetadata,
                                 removeExtensions
                               ) where

import Data.Geo.GPX.Accessor.Wpts
import Data.Geo.GPX.Accessor.Rtes
import Data.Geo.GPX.Accessor.Trks
import Data.Geo.GPX.Accessor.Metadata
import Data.Geo.GPX.Accessor.Extensions

-- | Removes all waypoints (wpt) elements from the given value.
removeWpts :: (Wpts a) =>
              a
              -> a
removeWpts = usingWpts (const [])

-- | Removes all tracks (trk) elements from the given value.
removeTrks :: (Trks a) =>
              a
              -> a
removeTrks = usingTrks (const [])

-- | Removes all routes (rte) elements from the given value.
removeRtes :: (Rtes a) =>
              a
              -> a
removeRtes = usingRtes (const [])

-- | Removes the metadata element from the given value.
removeMetadata :: (Metadata a) =>
                  a
                  -> a
removeMetadata = usingMetadata (const Nothing)

-- | Removes the extensions element from the given value.
removeExtensions :: (Extensions a) =>
                    a
                    -> a
removeExtensions = usingExtensions (const Nothing)
