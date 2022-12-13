{
  config,
  lib,
  pkgs,
  ...
}:

let
  haskellPackages = pkgs.haskellPackages;
in {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
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

  # shellHook
  shellHook = ''
    curl 'https://cnft.tools/lists/all' | jq '.[] | {key: .key, value: .value}' > out.js
  '';

  # indexing keys
  indexingKeys = {
    key1 = "value1";
    key2 = "value2";
    key3 = "value3";
  };
}
