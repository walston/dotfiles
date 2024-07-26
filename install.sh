#!/bin/bash

if [[ $(which -s brew) == "" ]] ; then
  echo "# Installing Homebrew" ;
  curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/master/install.sh" | bash ;
else
  echo "# Homebrew already installed" ;
fi
brew install git-delta httpie jq neovim nginx pure ripgrep wget zsh ;

if [[ ! -d "$HOME/.nvm" ]] ; then
  echo "# Installing NVM" ;
  curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh" | bash ;
else
  echo "# NVM already installed" ;
fi

# OS setup
# Copies OS setup stuff;
DOTFILES_DIR="$HOME/Repos/dotfiles" ;
if [[ -d "$DOTFILES_DIR" ]] ; then
  echo "Pulling walston/dotfiles in $DOTFILES_DIR";
  git -C "$DOTFILES_DIR" pull origin $(git -C "$DOTFILES_DIR" rev-parse --abbrev-ref HEAD);
else
  echo "Installing walston/dotfiles into $DOTFILES_DIR" ;
  git clone git@github.com:walston/dotfiles.git $DOTFILES_DIR ;
  read -p "Enter a branch name for this device [$(hostname)]:" branchname;
  name=${name:-$(hostname)}
  git -C "$DOTFILES_DIR" branch checkout -b "$name"
fi

ln -nsfv "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc" ;

CONFIG_NEOVIM_DIR="$HOME/.config/nvim"
if [[ ! -d "$CONFIG_NEOVIM_DIR" ]] ; then
  echo "# Installing AstroNvim"
  git clone git@github.com:walston/nvim.git "$CONFIG_NEOVIM_DIR"
else
  echo "# Updating AstroNvim"
  git -C "$CONFIG_NEOVIM_DIR" pull
fi

