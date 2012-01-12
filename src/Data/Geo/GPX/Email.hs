-- | Complex Type: @emailType@ <http://www.topografix.com/GPX/1/1/#type_emailType>
module Data.Geo.GPX.Email(
  Email
, email
) where

import Text.XML.HXT.Arrow

data Email = Email String String
  deriving (Eq, Ord)

email ::
  String -- ^ The id.
  -> String -- ^ The domain.
  -> Email
email =
  Email

