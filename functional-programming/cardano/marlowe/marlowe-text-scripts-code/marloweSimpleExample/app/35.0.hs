{-# LANGUAGE OverloadedStrings #-}
module Escrow where

import Language.Marlowe.Extended.V1

-- Escrow

main :: IO ()
main = printJSON alphaContract

price :: Value 
price = Constant 100  

pay, refund, both :: [Bound]
pay = [Bound 0 0]
refund = [Bound 1 1]
both = [Bound 0 1]

choice :: Party -> [Bound] -> Action
choice party = Choice (ChoiceId choiceName party)

choiceName :: choiceName
choiceName = "choice"

buyerChosen, sellerChosen :: Value
buyerChosen   = ChoiceValue (ChoiceId choiceName "buyer")
sellerChosen  = ChoiceValue (ChoiceId choiceName "seller")

defValue :: Value
defValue = Constant 3

------------------------------------------------------------

buyerPay, buyerRefund, buyerChoice, sellerPay, sellerRefund, sellerChoice,thirdPartyPay, thirdPartyRefund, thirdPartyChoice :: Action


buyerPay         = choice "buyer" pay
buyerRefund      = choice "buyer" refund
buyerChoice      = choice "buyer" both

sellerPay        = choice "seller" pay
sellerRefund     = choice "seller" refund
sellerChoice     = choice "seller" both

thirdPartyPay    = choice "thirdParty" pay   
thirdPartyRefund = choice "thirdParty" refund
thirdPartyChoice = choice "thirdParty" both

----------------------------------------------------------

agreement :: Contract 
agreement = If (buyerChosen `ValueEQ` Constant 420)
               (Pay "buyer" (Party "seller") ada price Close)
               Close



arbitrate :: Contract
arbitrate = When [Case thirdPartyRefund Close,
                  Case thirdPartyPay (Pay "buyer" (Party "seller") ada price Close)] 50 Close
    


alphaContract :: Contract
alphaContract = When [Case (Deposit "buyer" "buyer" ada price) innerContract] 25 Close



innerContract :: Contract
innerContract = When [Case buyerChoice
                (When [Case sellerChoice
                    (If (buyerChosen `ValueEQ` sellerChosen)
                        agreement
                        arbitrate
                    )] 50 Close
                )
             ] 20 arbitrate
    




{-
inner :: Contract
inner = When [Case buyerChoice (When [Case sellerChoice (If (buyerChosen `ValueEQ` sellerChosen) agreement arbitrate)] 50 Close)] 20 arbitrate
-}







