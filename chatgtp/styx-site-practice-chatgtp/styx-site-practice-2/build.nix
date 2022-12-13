#!/usr/bin/env nix-shell
#! nix-shell -i bash -p nix

nix-build -A site ./default.nix -o static-site

