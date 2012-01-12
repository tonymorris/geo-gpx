module Data.Geo.GPX.Example where

import Data.Geo.GPX

-- Remove all waypoints from a GPX file and write the result to a new file.
removeWaypoints :: FilePath -> FilePath -> IO ()
removeWaypoints = flip interactGpx removeWpts
