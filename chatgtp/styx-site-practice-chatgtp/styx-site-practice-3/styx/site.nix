{ pkgs ? import <nixpkgs> {} }:

pkgs.styx.githubPages {
  config = ./conf.nix;
  source = ./content;
  username = "sirbeerus"; # Replace this with your own GitHub username
}
