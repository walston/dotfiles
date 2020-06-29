#!/bin/zsh

# Homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash \
  && brew install ctags deno nginx python the_silver_searcher vim

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
