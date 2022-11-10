# minimal ~/abundant-solutions-dev/shell.nix file
let
  myNixPkgs = import <nixpkgs> {};
in
myNixPkgs.mkShell {
  nativeBuildInputs = with myNixPkgs; [
    ghc  # Haskell compiler
    cabal-install  # terminal app cabal
    haskellPackages.zlib
    haskellPackages.hakyll
  ];
}
