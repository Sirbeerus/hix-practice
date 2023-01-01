# hix-practice
https://input-output-hk.github.io/haskell.nix/tutorials/getting-started-hix.html



Installing Hix
To use the other Hix features first install Hix with:

$ git clone https://github.com/tek/hix.git

$ nix-build flake.nix

$ nix run "github:input-output-hk/haskell.nix#hix" -- init

# MacBook-Air nix % cd nix

# MacBook-Air nix % ls
hix.nix

$ nix run .#hello:exe:hello
