# minimal ~/practice/shell.nix file
let
  myNixPkgs = import <nixpkgs> {};
in
myNixPkgs.mkShell {
  nativeBuildInputs = with myNixPkgs; [
    cabal-install # terminal app cabal
    ghc # Haskell compiler
    cabal2nix
    ghc
    haskell-language-server
    ghcid

  ];
}
