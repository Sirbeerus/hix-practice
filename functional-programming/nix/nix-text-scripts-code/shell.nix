{ pkgs ? import <nixpkgs> {} } :
let
	myScript = pkgs.writeScriptBin "foobar" ''
		echo "Foobar";
		'';
in pkgs.mkShell {
	name = "MyAwesomeShell";
	buildInputs = with pkgs; [
		figlet
		myScript
	];

	shellHook = ''
	echo "Welcome to my awesome shell";
	'';

nix-shell
