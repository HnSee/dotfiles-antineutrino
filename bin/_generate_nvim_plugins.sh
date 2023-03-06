#!/bin/bash
nvim_config="${NVIM_CONFIG:-$HOME/config/nvim/init.lua}"
repos="$(grep -o -E '".*/.*"' $nvim_config | tr -d '"' | grep -v https | grep -v 'data)')"

for repo in $repos; do
  url_readme=$(printf "https://raw.githubusercontent.com/%s/master/README.md" "$repo")
  name=$(curl -sL "$url_readme" | grep -m1 -o -P '^#\s\K.+')
  url=$(printf "https://github.com/%s" "$repo")
  printf "[%s](%s)\n" "$name" "$url"
done
