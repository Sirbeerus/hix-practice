  { stdenv, fetchFromGitHub }:
  let
    pkgs = import <nixpkgs> {};
    site = import ./site.nix { inherit pkgs; };
  in
    pkgs.styx {
    inherit site;
    
    src = fetchFromGitHub {
      owner = "NixOS";
      repo = "nixpkgs";
      rev = "master";
      sha256 = "1f5cb2v2b1f5cb2v2b1f5cb2v2b1f5cb2v2b1f5cb2v2b1f5cb2v2b1f5cb2v2b";
    };
  }
