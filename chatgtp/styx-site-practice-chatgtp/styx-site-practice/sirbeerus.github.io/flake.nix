  {
    inputs.styx.url = "github:NixOS/nixpkgs";
    inputs.styx.rev = "master";
  
    outputs = { self, stdenv, styx, ... }:
    {
      deploy = {
        inherit stdenv;
        styx = styx.override {
          src = styx.src;
        };
        site = styx.site;
      };
    };
  }
