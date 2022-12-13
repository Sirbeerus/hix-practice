{
  # import the site.nix file
  site = import ./site.nix;

  # import the default.nix file
  default = import ./default.nix;
}
