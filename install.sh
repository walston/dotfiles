#!/bin/bash

if [ ! type brew 2>&1 >/dev/null ]; then
  echo "# Installing Homebrew" ;
  curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/master/install.sh" | bash \
    && brew install git-delta httpie jq nginx ripgrep vim wget zsh;
else
  echo "# Homebrew already installed" ;
fi

if [[ ! -d "$HOME/.nvm" ]]; then
  echo "# Installing NVM" ;
  curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh" | bash ;
else
  echo "# NVM already installed" ;
fi

# OS setup
# Copies OS setup stuff;
DOTFILES_DIR="$HOME/Repos/dotfiles" ;
if [ -d "$DOTFILES_DIR" ]; then
  echo "Pulling walston/dotfiles in $DOTFILES_DIR";
  git -C "$DOTFILES_DIR" pull origin $(git -C "$DOTFILES_DIR" rev-parse --abbrev-ref HEAD);
else
  echo "Installing walston/dotfiles into $DOTFILES_DIR" ;
  git clone git@github.com:walston/dotfiles.git $DOTFILES_DIR ;
  read -p "Enter a branch name for this device [$(hostname)]:" branchname;
  name=${name:-$(hostname)}
  git -C "$DOTFILES_DIR" branch checkout -b "$name"
fi

ln -nsfv "$DOTFILES_DIR/.zshrc"         "$HOME/.zshrc" ;
