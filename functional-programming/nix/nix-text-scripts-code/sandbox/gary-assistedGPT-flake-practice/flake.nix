let
  pkgs = import <nixpkgs> {};
  project = (import ./default.nix) {
    inherit pkgs;
  };
in pkgs.runCommand "my-haskell-project" {
  buildInputs = [ project ];
  shellHook = "${project.shellHook}";
}
