#!/bin/bash

# step 1: login to github
curl -u Sirbeerus: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 https://api.github.com/user/repos -d '{"name":"abundant-solutions-dev", "private":false, "auto_init":true, "gitignore_template":"NixOS"}'

# step 2: deploy the site
nixops deploy --show-trace --target github --name Sirbeerus --token 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 --repo abundant-solutions-dev
