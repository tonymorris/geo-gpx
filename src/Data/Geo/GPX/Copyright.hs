-- | Complex Type: @copyrightType@ <http://www.topografix.com/GPX/1/1/#type_copyrightType>
module Data.Geo.GPX.Copyright(
  Copyright
, copyright
) where

import Text.XML.HXT.Arrow

data Copyright = Copyright String (Maybe String) (Maybe String)
  deriving (Eq, Ord)

copyright
  :: String -- ^ The author.
  -> Maybe String -- ^ The year.
  -> Maybe String -- ^ The license.
  -> Copyright
copyright =
  Copyright

