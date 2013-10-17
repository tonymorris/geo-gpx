-- | Complex Type: @emailType@ <http://www.topografix.com/GPX/1/1/#type_emailType>
module Data.Geo.Gpx.Email(
  Email
, email
) where

data Email = Email String String
  deriving (Eq, Ord)

email ::
  String -- ^ The id.
  -> String -- ^ The domain.
  -> Email
email =
  Email
{-
instance IdL Email where
  idL =
    Lens $ \(Email id domain) -> store (\id -> Email id domain) id

instance DomainL Email where
  domainL =
    Lens $ \(Email id domain) -> store (\domain -> Email id domain) domain
-}

{-
instance XmlPickler Email where
  xpickle =
    xpWrap (uncurry email, \(Email id' domain') -> (id', domain'))
           (xpPair (xpAttr "id" xpText) (xpAttr "domain" xpText))
-}

