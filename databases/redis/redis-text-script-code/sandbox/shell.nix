# minimal ~/abundant-solutions-dev/shell.nix file
let
  myNixPkgs = import <nixpkgs> {};
in
myNixPkgs.mkShell {
  nativeBuildInputs = with myNixPkgs; [
    cabal-install # terminal app cabal
    ghc # Haskell compiler
    haskell-language-server
    redis
    ghcid
    haskellPackages.hedis
    bash
    ripgrep
    curl
  ];
  shellHook = ''
  curl -X GET https://api.coingecko.com/api/v3/ping
 # zc policy id: 96580bbc4fe27ac0d127db3f8a0dc698c58d303d8cae870f5771f336
 # zh policy id: 320bb921e517c8111e309b2822633da6c9af346ca4e18b79a94864b3
 curl -H 'Content-Type: application/json' -XGET 'https://cnft.tools/lists?name=1'
  '';
}
