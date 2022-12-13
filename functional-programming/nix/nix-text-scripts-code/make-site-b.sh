#!/bin/bash
# step 1: create a grotto repo
curl -H "Authorization: token $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" https://api.github.com/user/repos -d '{"name":"grotto"}'

# step 2: clone the repo
git clone https://github.com/Sirbeerus/grotto.git

# step 3: change the directory
cd grotto

# step 4: create the files
cat <<EOF >> conf.nix
{
  server = {
    host = "0.0.0.0";
    port = 80;
  };
  deploy = {
    githubPages = {
      repo = "Sirbeerus/grotto";
      token = "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";
      branch = "gh-pages";
    };
  };
}
EOF

cat <<EOF >> site.nix
{
  title = "Grotto";
  body = "Welcome to my functional site! An exercise in futility. Join us on discord?";
  links = [
    {
      text = "Cardano";
      url = "https://developers.cardano.org/";
    },
    {
      text = "Discord";
      url = "https://discord.gg/YSnJrN9wwe";
    },
    {
      text = "Vending Machine";
      url = "https://www.wildtangz.com/vending-machine/";
    },
  ];
}
EOF

cat <<EOF >> default.nix
{
  imports = [ "site.nix" ];
}
EOF

cat <<EOF >> flake.nix
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
EOF

cat <<EOF >> deployments.nix
{
  deployment.styx.enable = true;
  deployment.styx.targetEnv = "production";
  deployment.styx.flake = {
    url = "github.com/Sirbeerus/grotto/flake.nix";
    rev = "master";
  };
  deployment.styx.inputs.site.url = "https://github.com/Sirbeerus/grotto.git";
}
EOF

cat <<EOF >> static/index.html
<html>
    <head>
        <title>Grotto</title>
    </head>
    <body>
        <h1>Welcome to the Grotto!</h1>
        <p>An exercise in futility! Join us on Discord?</p>
    </body>
</html>
EOF

# step 5: add all the files
git add -A

# step 6: commit the files
git commit -m "initial commit"

# step 7: push the files
git push origin master

# step 8: deploy the site
nixops deploy -d grotto --show-trace
