{

  description = "A simple script";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
	pkgs = nixpkgs.legacyPackages.${system};
      in 
      pkgs.writeShellScriptBin "my-script" ''
        DATE="$(${pkgs.ddate}/bin/ddate +'the %e of %B%, %Y')"
        ${pkgs.cowsay}/bin/cowsay Hello, world! Today is $DATE.
      '')

        devShell = pkgs.mkShell { buildInputs = [ pkgs.hello pkgs.cowsay ]; };
      });
}
