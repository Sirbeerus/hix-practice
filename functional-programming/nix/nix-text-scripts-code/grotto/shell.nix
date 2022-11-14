# minimal ~/abundant-solutions-dev/shell.nix file
let
  myNixPkgs = import <nixpkgs> {};
in
myNixPkgs.mkShell {
  nativeBuildInputs = with myNixPkgs; [
    cabal-install # terminal app cabal
    ghc # Haskell compiler
    haskellPackages.hakyll # static haskell site generator
    cabal2nix
    ghc
    haskell-language-server
    haskellPackages.zlib
    zlib

  ];
}
