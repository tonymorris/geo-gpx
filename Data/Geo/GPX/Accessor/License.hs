module Data.Geo.GPX.Accessor.License where

import Data.Geo.GPX.Accessor.Accessor

class License a where
  license :: a -> Maybe String
  setLicense :: Maybe String -> a -> a

  setLicense' :: String -> a -> a
  setLicense' = setLicense . Just

  usingLicense :: a -> (Maybe String -> Maybe String) -> a
  usingLicense = license `using` setLicense
