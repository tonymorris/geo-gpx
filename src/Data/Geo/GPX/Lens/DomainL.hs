module Data.Geo.GPX.Lens.DomainL where

import Data.Lens.Common

class DomainL a where
  domainL :: Lens a String

