
-- | Test utility functions
module Test.Util(utilsTests) where

import Test.Tasty
import Test.Tasty.HUnit

import Language.Haskell.Ghcid.Util
import Language.Haskell.Ghcid.Escape

utilsTests :: TestTree
utilsTests = testGroup "Utility tests"
    [dropPrefixTests
    ,wordWrapTests
    ]

dropPrefixTests :: TestTree
dropPrefixTests = testGroup "dropPrefix"
    [testCase "Prefix not found" $ dropPrefixRepeatedly "prefix" "string"  @?= "string"
    ,testCase "Empty prefix" $ dropPrefixRepeatedly "" "string" @?= "string"
    ,testCase "Prefix found once" $ dropPrefixRepeatedly "str" "string" @?= "ing"
    ,testCase "Prefix found twice" $ dropPrefixRepeatedly "str" "strstring" @?= "ing"
    ]

wordWrapTests :: TestTree
wordWrapTests = testGroup "wordWrap"
    [testCase "Max 0" $ wordWrapE 4 0 (Esc "ab cd efgh") @?= [s"ab c",s"d ef",h"gh"]
    ,testCase "Max 2" $ wordWrapE 4 2 (Esc "ab cd efgh") @?= [h"ab ",h"cd ",h"efgh"]
    ]
    where h x = (Esc x, WrapHard)
          s x = (Esc x, WrapSoft)
