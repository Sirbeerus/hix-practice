# minimal ~/abundant-solutions-dev/shell.nix file
let
  myNixPkgs = import <nixpkgs> {};
in
myNixPkgs.mkShell {
  nativeBuildInputs = with myNixPkgs; [
    cabal-install  # terminal app cabal
    ghc  # Haskell compiler
    ghcid
    haskell-language-server  
    haskellPackages.Spock
    haskellPackages.aeson
    haskellPackages.wai
    haskellPackages.warp
    haskellPackages.conduit-extra
    haskellPackages.blaze
    haskellPackages.Spock-digestive
  ];
}
