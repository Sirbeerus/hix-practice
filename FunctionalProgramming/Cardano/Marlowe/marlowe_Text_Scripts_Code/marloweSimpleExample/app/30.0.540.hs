{-# LANGUAGE OverloadedStrings #-}
module Example where

import Language.Marlowe.Extended.V1

--Simple send crypto contract

main :: IO ()
main = print . pretty $ mySimpleExample

mySimpleExample :: Contract
mySimpleExample = 
    When
        [Case (Deposit "You" "Me" ada (Constant 30)) Close
        ]
        420 Close
