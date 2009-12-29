-- | Complex Type: @emailType@ <http://www.topografix.com/GPX/1/1/#type_emailType>
module Data.Geo.GPX.EmailType(
                               EmailType,
                               emailType
                             ) where

import Text.XML.HXT.Arrow
import Data.Geo.GPX.Accessor.Id
import Data.Geo.GPX.Accessor.Domain

data EmailType = EmailType String String
  deriving (Eq, Show)

emailType :: String -- ^ The id.
             -> String -- ^ The domain.
             -> EmailType
emailType = EmailType

instance XmlPickler EmailType where
  xpickle = xpWrap (uncurry emailType, \(EmailType id' domain') -> (id', domain'))
              (xpPair (xpAttr "id" xpText) (xpAttr "domain" xpText))

instance Id EmailType where
  id (EmailType x _) = x

instance Domain EmailType where
  domain (EmailType _ x) = x
