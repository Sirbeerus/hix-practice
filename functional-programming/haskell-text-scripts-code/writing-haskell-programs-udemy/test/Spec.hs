module Main (main) where

import Test.Hspec

myAdd' :: Int -> Int -> Int
myAdd' x y = x + y

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "myAdd" $ do
        it "should return 11 when I pass 5 and 6" $ do myAdd 5 6 `shouldBe` 11
        
    describe "mySum" $ do 
        it "should return 2 when I pass 7 and 5" $ do
            mySub 7 5 `shouldBe` 2
        it "should return 2 when I pass 7 and 5" $ do
            mySub 10 10 `shouldBe` 0
        
