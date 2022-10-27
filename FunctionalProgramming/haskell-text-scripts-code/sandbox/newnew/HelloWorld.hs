#! /usr/bin/env -S"ANSWER=Coffe" nix-shell
#! nix-shell -p ghcid
#! nix-shell -p "haskellPackages.ghcWithPackages (p: [p.shower])"
#! nix-shell -i "ghcid -c 'ghci -Wall' -T main"

module HelloWorld where

import Shower (printer)
import System.Environment (getEnv)

main :: IO ()
main = do
  let question = "The answer to life the universe and everything"
  answer <- getEnv "ANSWER"
  printer (question, "is", answer)


  