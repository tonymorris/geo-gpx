module Data.Geo.GPX.Accessor.License where

import Data.Geo.GPX.Accessor.Accessor

class License a where
  license :: a -> Maybe String
  setLicense :: Maybe String -> a -> a

  setLicense' :: String -> a -> a
  setLicense' = setLicense . Just

  usingLicense :: (Maybe String -> Maybe String) -> a -> a
  usingLicense = license `using` setLicense

  usingLicense' :: (String -> String) -> a -> a
  usingLicense' = usingLicense . fmap
