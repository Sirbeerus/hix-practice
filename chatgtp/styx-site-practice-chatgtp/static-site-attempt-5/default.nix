let
  pkgs = import <nixpkgs> {};

in

builder.styx.build {
  src = ./site.nix;
  builder = pkgs.styx.builders.gh-pages;
}
{
  nixpkgs.config.allowUnfree = true;
}


