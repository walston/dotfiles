#!/bin/sh

# ZSH
curl -fsSL "https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | sh

# Homebrew
curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/master/install.sh" | bash \
  && brew install ctags deno nginx python the_silver_searcher vim

# NVM
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh" | bash

# vim-plugin manager
curl -fLo "~/.vim/autoload/plug.vim" --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# OS setup
# Copies OS setup stuff;
git clone git@github.com:walston/osx-setup.git ~/Repos/osx-setup \
  && cd ~/Repos/osx-setup \
  && ln -s ~/Repos/osx-setup/.zshrc ~/.zshrc \
  && ln -s ~/Repos/osx-setup/.profile ~/.profile \
  && ln -s ~/Repos/osx-setup/.bash_profile ~/.bash_profile \
  && ln -s ~/Repos/osx-setup/.vimrc ~/.vimrc && vim +PluginInstall +qall \
  ;

