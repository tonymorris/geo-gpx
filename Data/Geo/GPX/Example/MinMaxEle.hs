module Data.Geo.GPX.Example.MinMaxEle where

import Data.Geo.GPX
import Data.Maybe
import Control.Monad
import Control.Arrow

-- Finds the minimum and maximum elevation (<ele>) in a list of GPX files (fails if no elevation).
minMaxEle :: [FilePath] -> IO (Double, Double)
minMaxEle = fmap ((minimum &&& maximum) . (maybeToList . ele =<<) . (wpts . value =<<) . join) . mapM readGpxFile
