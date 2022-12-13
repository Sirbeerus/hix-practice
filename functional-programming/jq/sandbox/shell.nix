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
    coreutils
  ];
  shellHook = ''
  #bash commands here

  curl -X GET https://api.coingecko.com/api/v3/ping

  '';
}
