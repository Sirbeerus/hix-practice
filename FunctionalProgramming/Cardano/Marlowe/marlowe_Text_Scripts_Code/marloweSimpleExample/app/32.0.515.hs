{-# LANGUAGE OverloadedStrings #-}
module Example' where

import Language.Marlowe.Extended.V1

main :: IO ()
main = printJSON contract



contract :: Contract
contract = 
    When
        [Case (Choice (ChoiceId "amount" "me") [Bound 1 1000]) $
            When
                [Case (Deposit "you" "me" ada (ChoiceValue (ChoiceId "amount" "me"))) Close] 840 Close] 420 Close
