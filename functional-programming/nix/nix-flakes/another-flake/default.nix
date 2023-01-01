{
  # Import the flake that defines your project.
  # This file should be located at the root of your project directory.
  flake = import ./flake.nix;

  # Use the `build-flake` function to build your project.
  # This will automatically resolve all dependencies and build your project.
  build-flake = pkgs.haskell.lib.buildFlake {
    flake = flake;
  };
}
