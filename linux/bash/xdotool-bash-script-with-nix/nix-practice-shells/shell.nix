# minimal ~/abundant-solutions-dev/shell.nix file
# Captains Log
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
    curl
    coreutils
  ];
  shellHook = ''
  read -p "What would you like to-do? " event
  echo "$event" | /usr/bin/calendar add --title "$event" --all-day
  echo "$event" >> ~/Documents/programming/calendar/$(date +%F_%H-%M-%S).txt
 ''; }


 read -p "What has been completed? " eventc
  echo "$eventc" | /usr/bin/calendar add --title "$eventc" --all-day
  echo "$eventc" >> ~/Documents/programming/calendar/$(date +%F_%H-%M-%S).txt
 ''; }


 

 # echo "#!/bin/bash" > my_script.sh
 # echo "pwd" >> my_script.sh
 # bash my_script.sh



  # echo "#!/bin/bash" > script.sh




  curl -X GET https://api.coingecko.com/api/v3/ping
  '';
}
