{ pkgs ? import <nixpkgs> {},
  stdenv ? pkgs.stdenv,
  bash ? pkgs.bash,
  ripgrep ? pkgs.ripgrep,
  curl ? pkgs.curl,
  jq ? pkgs.jq,
  haskellPackages ? pkgs.haskellPackages
}: 

let 
  haskellPlatform = (haskellPackages.meta.platform.ghc864.override {
    overrideAttrs = old: {
      cabal-install = old.cabal-install.override {
        enable-library-profiling = false;
      };
      ghc = old.ghc.override {
        enable-library-profiling = false;
        enable-shared = false;
      };
    };
  });
in

stdenv.mkDerivation {
  name = "flake-nix";
  buildInputs = with pkgs; [
    cabal-install
    cabal
    ghc
    haskell-language-server
