module Data.Geo.GPX.Lens.TimeL where

import Text.XML.XSD.DateTime
import Data.Lens.Common

class TimeL a where
  timeL :: Lens a (Maybe DateTime)

