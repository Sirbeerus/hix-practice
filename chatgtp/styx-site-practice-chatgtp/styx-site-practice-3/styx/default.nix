with import <nixpkgs> {};

styx.mkShell {
  buildInputs = [
    graphviz
    git
  ];
}
