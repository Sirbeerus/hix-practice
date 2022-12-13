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
    haskellPackages.hlint
  ];
}
