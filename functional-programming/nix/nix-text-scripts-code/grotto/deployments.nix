{
  deployment.styx.enable = true;
  deployment.styx.targetEnv = "production";
  deployment.styx.flake = {
    url = "github.com/Sirbeerus/grotto/flake.nix";
    rev = "master";
  };
  deployment.styx.inputs.site.url = "https://github.com/Sirbeerus/grotto.git";
}
