#!/bin/bash

# ZSH
curl -fsSL "https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | bash;

# Homebrew
curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/master/install.sh" | bash \
  && brew install deno nginx ripgrep vim;

# NVM
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh" | bash;

# vim-plugin manager
curl -fLo "~/.vim/autoload/plug.vim" --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";

# OS setup
# Copies OS setup stuff;
let DOTFILES_DIR="~/Repos/dotfiles"
git clone git@github.com:walston/dotfiles.git $DOTFILES_DIR;

ln -nsf $DOTFILES_DIR/.zshrc ~/.zshrc ;
ln -nsf $DOTFILES_DIR/.profile ~/.profile ;
ln -nsf $DOTFILES_DIR/.bash_profile ~/.bash_profile ;
ln -nsf $DOTFILES_DIR/.vimrc ~/.vimrc;
  
vim +PluginInstall +qall ;
  

