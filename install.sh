#!/bin/bash

echo "# Installing Homebrew" ;
curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/master/install.sh" | bash \
  && brew install git-delta httpie jq nginx ripgrep vim wget zsh;

echo "# Installing NVM" ;
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh" | bash ;

# OS setup
# Copies OS setup stuff;
DOTFILES_DIR="$HOME/Repos/dotfiles" ;
echo "Installing walston/dotfiles into $DOTFILES_DIR" ;
if [ -d "$DOTFILES_DIR" ]; then
  git -C "$DOTFILES_DIR" pull ;
else
  git clone git@github.com:walston/dotfiles.git $DOTFILES_DIR ;
fi

ln -nsfv "$DOTFILES_DIR/.zshrc"         "$HOME/.zshrc" ;
