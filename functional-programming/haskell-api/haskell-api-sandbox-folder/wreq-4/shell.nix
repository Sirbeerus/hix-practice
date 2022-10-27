# full "~/wreq-4/shell.nix" file
let
  myNixPkgs = import <nixpkgs> {
    overlays = [myNixPkgsOverlay];
  };

  myNixPkgsOverlay = (nixSelf: nixSuper: {
    myHaskellPackages = nixSelf.haskellPackages.override (oldHaskellPkgs: {
      overrides = nixSelf.lib.composeExtensions (oldHaskellPkgs.overrides or (_: _: {}))  myHaskellPkgsOverlay;
    });
  });

  myHaskellPkgsOverlay = (hSelf: hSuper: {
    # "wreq-4" is the first part of the "wreq-4.cabal" project definition file
    wreq-4 = hSelf.callCabal2nix "wreq-4" ./. {};
  });

  myDevTools = with myNixPkgs; [
    cabal-install
    haskellPackages.ghcid
    haskellPackages.wreq
    haskellPackages.lens
    haskellPackages.aeson

  ];

  myShellHook = ''
    alias repl="cabal new-repl"
  '';
in
myNixPkgs.myHaskellPackages.myProject.env.overrideAttrs (oldEnv: {
  nativeBuildInputs = oldEnv.nativeBuildInputs ++ myDevTools;
  shellHook = myShellHook;
})
