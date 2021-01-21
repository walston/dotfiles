#!/bin/bash

# ZSH
curl -fsSL "https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | bash

# Homebrew
curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/master/install.sh" | bash \
  && brew install ctags deno nginx python ripgrep the_silver_searcher vim

# NVM
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh" | bash

# vim-plugin manager
curl -fLo "~/.vim/autoload/plug.vim" --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# OS setup
# Copies OS setup stuff;
git clone git@github.com:walston/dotfiles.git ~/Repos/dotfiles \
  && cd ~/Repos/dotfiles \
  && ln -s ~/Repos/dotfiles/.zshrc ~/.zshrc \
  && ln -s ~/Repos/dotfiles/.profile ~/.profile \
  && ln -s ~/Repos/dotfiles/.bash_profile ~/.bash_profile \
  && ln -s ~/Repos/dotfiles/.vimrc ~/.vimrc && vim +PluginInstall +qall \
  ;

