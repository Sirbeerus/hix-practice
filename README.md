# hix-practice
https://input-output-hk.github.io/haskell.nix/tutorials/getting-started-hix.html


https://input-output-hk.github.io/haskell.nix/tutorials/getting-started-hix.html

Installing Hix
To use the other Hix features first install Hix with:

$ git clone https://github.com/tek/hix.git

$ nix-build flake.nix

$ nix run "github:input-output-hk/haskell.nix#hix" -- init

MacBook-Air nix % cd nix
MacBook-Air nix % ls
hix.nix
MacBook-Air nix % cat hix.nix
{pkgs, ...}: {
  # name = "project-name";
  compiler-nix-name = "ghc8107"; # Version of GHC to use

  # Cross compilation support:
  # crossPlatforms = p: pkgs.lib.optionals pkgs.stdenv.hostPlatform.isx86_64 ([
  #   p.mingwW64
  #   p.ghcjs
  # ] ++ pkgs.lib.optionals pkgs.stdenv.hostPlatform.isLinux [
  #   p.musl64
  # ]);

  # Tools to include in the development shell
  shell.tools.cabal = "latest";
  # shell.tools.hlint = "latest";
  # shell.tools.haskell-language-server = "latest";
}

nix run .#hello:exe:hello
