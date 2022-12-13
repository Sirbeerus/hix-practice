{ lib, pkgs, ... }:

let
  styx = pkgs.styx;
  site = {
    background-color = "grey";
    title = "abundant-solutions-dev";
    body = "Welcome to my functional site! Contemplating solutions. Join us on discord?";
    links = [
      { url = "https://developers.cardano.org/"; text = "Cardano Developers"; },
      { url = "https://discord.gg/YSnJrN9wwe"; text = "Discord"; },
    ];
  };
in
  styx.makeSite {
    inherit site;
  }
