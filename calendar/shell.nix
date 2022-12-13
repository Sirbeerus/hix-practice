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
  clear
  echo "Hello"
  bash bash-script-foo.sh
  '';
}
