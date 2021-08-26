module Time where

import Data.Time

data DatabaseItem = DbString String | DbNumber Integer | DbDate UTCTime 
     deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase = 
   [ DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123))
   , DbNumber 9001
   , DbString "Hello, world!"
   , DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123))
   ]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate db = foldr go [] db
  where go (DbDate x) y = x : y
        go _ y = y

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber db = foldr go [] db
   where go (DbNumber x) y = x : y
         go _ y = y 

mostRecent :: [DatabaseItem] -> UTCTime 
mostRecent = minimum . filterDbDate