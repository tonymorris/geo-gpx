module Data.Geo.GPX.Example where

import Data.Geo.GPX

-- Remove all waypoints from a GPX file and writes the result to a new file.
removeWpts :: FilePath -> FilePath -> IO ()
removeWpts = flip interactGpx (usingWpts (const []))
