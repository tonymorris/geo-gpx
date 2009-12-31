module Data.Geo.GPX.Example.Interact where

import Data.Geo.GPX

interaction :: FilePath -> FilePath -> IO ()
interaction = flip interactsGpx [
                setCopyright' (copyrightType "Fred" (Just "2009") (Just "BSD3")), -- set the copyright in the metadata
                flip usingWpts (home:),                                           -- add a waypoint (home)
                setCreator "Me!"]                                                 -- set the creator

home :: WptType
home = wptType (latitudeType (-27.69301)) (longitudeType 152.718) (Just 326.7) Nothing Nothing Nothing (Just "My house") (Just "I live here") Nothing Nothing [] Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing
