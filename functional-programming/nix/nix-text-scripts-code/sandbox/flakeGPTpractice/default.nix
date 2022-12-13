let
  pkgs = import <nixpkgs> {};
  haskellPackages = pkgs.haskellPackages;
in

pkgs.stdenv.mkDerivation {
  name = "flake";
  buildInputs = [
    cabal-install
    cabal
    ghc
    haskell-language-server
    redis
    ghcid
    haskellPackages.hedis
    bash
    ripgrep
    curl
  ];
  shellHook = ''
  #  curl 'https
