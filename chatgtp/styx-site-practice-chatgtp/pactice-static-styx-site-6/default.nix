let
  # import the conf.nix file
  conf = import ./conf.nix;
in {
  # create the site
  site = Deployable.staticSite {
    config = conf;
  };

  # deploy the site
  deploy = {
    # deploy to github
    github = Deployable.github {
      name = "Sirbeerus";
      token = "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";
      repo = "abundant-solutions-dev";
    };
  };
}
