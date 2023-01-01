{
  description = "My Nix flake project using Haskell and Flake Utilities";
  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  inputs.flakeUtils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flakeUtils }: {
    myProject = nixpkgs.callPackage ({
      # A list of packages that your project depends on goes here
      # For example, you can include GHC like this:
      ghc = nixpkgs.ghc;
      # You can also include other Haskell libraries and tools your project uses
    } // {
      src = ./.;
      # Use GHC to build your project
      shellHook = ''
        ${nixpkgs.ghc}/bin/ghc HelloWorld.hs
      '';
    });
  };
}
