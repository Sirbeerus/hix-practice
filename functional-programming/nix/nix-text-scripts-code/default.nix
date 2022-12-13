{ pkgs ? import <nixpkgs> {} }:

pkgs.styx.mkSite {
  siteName = "abundant-solutions-dev";
  contents = ''
    <h1>abundant-solutions-dev</h1>
    <p>Welcome to my functional site! An exercise in futility. Join us on discord?</p>
    <a href="https://developers.cardano.org/">https://developers.cardano.org/</a>
    <a href="https://discord.gg/YSnJrN9wwe">https://discord.gg/YSnJrN9wwe</a>
    <a href="https://www.wildtangz.com/vending-machine/">https://www.wildtangz.com/vending-machine/</a>
  '';
  css = ''
    body {
      background-color: grey;
    }
  '';
}

