#!/bin/bash

if [ ! type zsh 2>&- ]; then
  echo "# Installing ZSH" ;
  curl -fsSL "https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | bash ;
else
  echo "# ZSH already installed" ;
fi

if [ ! type brew 2>&- ]; then
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

if [[ ! -d "$HOME/.vim/plugged" ]]; then
  echo "# Installing Plug.vim manager"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ;
else
 echo "# Plug.vim already installed" ;
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
ln -nsfv "$DOTFILES_DIR/.profile"       "$HOME/.profile" ;
ln -nsfv "$DOTFILES_DIR/.bash_profile"  "$HOME/.bash_profile" ;
ln -nsfv "$DOTFILES_DIR/.vimrc"         "$HOME/.vimrc" ;

vim +PluginInstall +qall ;


