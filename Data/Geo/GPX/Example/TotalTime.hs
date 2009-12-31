module Data.Geo.GPX.Example.TotalTime where

import Data.Geo.GPX
import Data.Time
import Data.Maybe
import Text.XML.XSD.DateTime

startEnd :: FilePath -> IO (DateTime, DateTime)
startEnd = fmap ((minimum &&& maximum) . (maybeToList . time =<<) . (trkpts =<<)) . readGpxFile

report :: FilePath -> IO ()
report p = do (start, end) <- startEnd p
              print ("Start:        " ++ show start)
              print ("End:          " ++ show end)
              print ("Total Time:   " ++ show (uncurry diffUTCTime (toUTCTime end, toUTCTime start)))
