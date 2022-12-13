{ pkgs ? import <nixpkgs> {} }:

pkgs.styx.build {
  config = ./conf.nix;
  source = ./content;
}
