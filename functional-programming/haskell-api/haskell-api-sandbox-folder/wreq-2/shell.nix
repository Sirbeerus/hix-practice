# minimal ~/wreq-1/shell.nix file
let
  myNixPkgs = import <nixpkgs> {};
in
myNixPkgs.mkShell {
  nativeBuildInputs = with myNixPkgs; [
    cabal-install # terminal app cabal
    ghc # Haskell compiler
    haskellPackages.wreq
    cabal2nix
    haskellPackages.lens
    haskellPackages.aeson
  ];
}
