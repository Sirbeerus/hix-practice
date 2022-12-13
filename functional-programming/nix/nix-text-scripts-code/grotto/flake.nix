{
  inputs.site.url = "https://github.com/Sirbeerus/grotto.git";
  inputs.site.rev = "master";
  outputs = {
    self, nixpkgs, site
  }:
  {
    site-deploy = {
      inherit site;
      inherit self;
      inherit nixpkgs;
    };
  };
}
