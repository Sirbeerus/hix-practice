# full "~/wreq-3/shell.nix" file
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
    # "wreq-3" is the first part of the "wreq-3.cabal" project definition file
    myProject = hSelf.callCabal2nix "wreq-3" ./. {};
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
