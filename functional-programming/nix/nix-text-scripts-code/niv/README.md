Then when you want to update to the latest version of haskellNix use:

niv update          # update all packages
niv update haskellNix
niv update nixpkgs -b master


niv add stedolan/jq
niv add ghc

niv drop jq

niv show jq

jq
  branch: master
  description: Command-line JSON processor
  homepage: http://stedolan.github.io/jq/
  owner: stedolan
  repo: jq
  rev: cff5336ec71b6fee396a95bb0e4bea365e0cd1e8
  sha256: 17cdjz54yg6yls3l2n69b67hbi7y7ic1znbym196f0n4xv4y1jc2
  type: tarball
  url: https://github.com/stedolan/jq/archive/cff5336ec71b6fee396a95bb0e4bea365e0cd1e8.tar.gz
  url_template: https://github.com/<owner>/<repo>/archive/<rev>.tar.gz

------------------------------------------------------


# minimal ~/abundant-solutions-dev/shell.nix file
let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
in
 with pkgs;
 pkgs.mkShell {
    buildInputs = [
         ghc cabal-install cowsay
  ];
}

--------------------------------------------------------
















