{
  inputs = {
    haskellPackages = import (builtins.fetchTarball {
      name = "haskell-packages";
      url = "https://github.com/NixOS/nixpkgs/tarball/ffc47bdda8d7e3f3f01be7c9f72d70c95a2b2a74";
      sha256 = "1wj6gf1hry0ik6bvj6pzp6lg34sabzcjc5vn8a7pbd68jdj0nks5";
    });
  };

  outputs = { self, haskellPackages }: {
    ghc = haskellPackages.ghcWithPackages (self: with self; [
      self
      Hello
    ]);
  };
}
