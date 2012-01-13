-- | Complex Type: @emailType@ <http://www.topografix.com/GPX/1/1/#type_emailType>
module Data.Geo.GPX.Email(
  Email
, email
) where

import Text.XML.HXT.Arrow
import Data.Geo.GPX.Lens.IdL
import Data.Geo.GPX.Lens.DomainL
import Data.Lens.Common
import Control.Comonad.Trans.Store

data Email = Email String String
  deriving (Eq, Ord)

email ::
  String -- ^ The id.
  -> String -- ^ The domain.
  -> Email
email =
  Email

instance IdL Email where
  idL =
    Lens $ \(Email id domain) -> store (\id -> Email id domain) id

instance DomainL Email where
  domainL =
    Lens $ \(Email id domain) -> store (\domain -> Email id domain) domain

