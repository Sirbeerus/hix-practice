# minimal ~/abundant-solutions-dev/shell.nix file
let
  myNixPkgs = import <nixpkgs> {};
in
myNixPkgs.mkShell {
  nativeBuildInputs = with myNixPkgs; [
    cabal-install # terminal app cabal
    ghc # Haskell compiler
    haskell-language-server
    redis
    ghcid
    haskellPackages.hedis
    bash
    ripgrep
    curl
    coreutils
  ];
  shellHook = ''

 # URL=$(curl 'https://cnft.tools/lists/all') 
 # echo "$URL"; 

 # echo "#!/bin/bash" > my_script.sh
 # echo "pwd" >> my_script.sh
  bash my_script.sh
  
 
 # echo Which project?
 # read varname
 # echo Okay, $varname
  
  # echo "#!/bin/bash" > script.sh

 # URL=$(curl \'https://cnft.tools/lists/all\' | jq \'to_entries | map( {(.value.name): .key}) | add\' | grep zombiechains ")
 # echo "$URL";
   

  curl -X GET https://api.coingecko.com/api/v3/ping
  '';
}
