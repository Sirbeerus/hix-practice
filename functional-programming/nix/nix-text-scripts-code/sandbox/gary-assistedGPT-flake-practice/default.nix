{ pkgs ? import <nixpkgs> {} }:

let
  haskellPackages = pkgs.haskellPackages;
  haskellDeps = haskellPackages.ghcid.override {
    doCheck = false;
  };
in pkgs.stdenv.mkDerivation {
  name = "my-haskell-project";
  buildInputs = [
    haskellPackages.cabal-install
    haskellPackages.ghc
    haskellPackages.haskell-language-server
    haskellPackages.hedis
    haskellPackages.bash
    haskellPackages.curl
    haskellDeps
  ];
  shellHook = ''
    curl -L https://cnft.tools/lists/all | jq '.outputs | with_entries(.key |= index(".")) | .outputs | to_entries[] | .key + "=" + .value' > outputs.js
  '';
}
