module Acme.Safe where

import Acme.Dont

-- | Safely extract a value from a Just
safeFromJust :: Maybe a -> Maybe a
safeFromJust Nothing = Nothing
safeFromJust (Just x) = Just x

-- | Safely extract a value from a Left
safeFromLeft :: Either a b -> Either a b
safeFromLeft (Left x) = Left x
safeFromLeft (Right x) = Right x

-- | Safely doesn't perform IO with the help of acme-dont. Side-effects-free!
safePerformIO :: IO a -> Maybe (IO ())
safePerformIO = Just . don't
--safePerformIO launchMissiles = Nothing --ready for the upcoming function-pattern-matching

-- | Doesn't print the provided debug string. But it's 100% safe!
safeTrace :: String -> a -> Maybe (IO ())
safeTrace s x = safePerformIO $ do
                                    putStrLn s
                                    return x

-- | Safely converts a value from any type to any other type.
safeCoerce :: a -> Maybe b
safeCoerce _ = Nothing
