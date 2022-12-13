# minimal ~/abundant-solutions-dev/shell.nix file
let
  myNixPkgs = import <nixpkgs> {};
in
myNixPkgs.mkShell {
  nativeBuildInputs = with myNixPkgs; [
    cabal-install # terminal app cabal
    ghc # Haskell compiler
    haskell-language-server
    haskellPackages.zlib
    haskellPackages.aeson
    haskellPackages.wreq
    haskellPackages.lens
    haskellPackages.lens-aeson    
  ];
}
