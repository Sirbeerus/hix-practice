{
  description = "My Nix application";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
                pkgs = nixpkgs.legacyPackages.${system}
      packages.hello = pkgs.hello;
     haskellPackages = pkgs.haskellPackages; 
 
       in {

        # Name Package Here.

        packageName =  "sand-castle";
      
        packages.${packageName} = haskellPackages.callCabal2nix packageName self rec {
            # Dependency overrides go here

         };

        devShell =
 pkgs.mkShell {
   name = "sand-castle";
   buildInputs = with pkgs ; [
   ghc
   cabal-install
   ghcid
   haskell-language-server
   redis
   hedis
   bash
  ];

  shellHook = ''
    echo "Welcome to my awesome shell!";
  '' ;
              };
      });
}
