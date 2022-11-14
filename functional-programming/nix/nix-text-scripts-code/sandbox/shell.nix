
{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  name = "MyAwesomeShell";
  buildInputs = with pkgs ; [
   figlet
  ];

  shellHook = ''
    echo "hello !" | figlet ;
  '' ;
}




