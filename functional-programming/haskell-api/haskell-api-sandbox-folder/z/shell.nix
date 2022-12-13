# minimal ~/abundant-solutions-dev/shell.nix file
let
  myNixPkgs = import <nixpkgs> {};
in
myNixPkgs.mkShell {
  nativeBuildInputs = with myNixPkgs; [
    cabal-install  # terminal app cabal
    ghc  # Haskell compiler
    ghcid # auto complile 
    haskell-language-server 
    redis #database
    haskellPackages.hedis
    haskellPackages.wreq 
    haskellPackages.aeson 
    haskellPackages.lens 
    haskellPackages.zlib
  ];
}
