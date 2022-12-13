{ pkgs ? import <nixpkgs> {} }:

let 
  haskellPackages = pkgs.haskellPackages;
  haskellPackages_ghc822 = pkgs.haskellPackages.ghc822;
  haskellPackages_ghc844 = pkgs.haskellPackages.ghc844;
  haskellPackages_ghc884 = pkgs.haskellPackages.ghc884;
in 
  {
    flake.nix = {
      description = "Haskell project with cabal-install, cabal, ghc, haskell-language-server, redis, ghcid, haskellPackages.hedis, bash, ripgrep, curl";
  
      inputs = {
        nixpkgs.url = builtins.fetchGit {
          url = "https://github.com/NixOS/nixpkgs";
        };
  
        haskellPackages.url = builtins.fetchGit {
          url = "https://github.com/haskell/
