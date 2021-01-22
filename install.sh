#!/bin/bash

echo "# Installing ZSH" ;
curl -fsSL "https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | bash ;

echo "# Installing Homebrew" ;
curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/master/install.sh" | bash \
  && brew install deno nginx ripgrep vim ;

echo "# Installing NVM" ;
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh" | bash ;

echo "# Installing vim-plugin manager"
curl -fLo "~/.vim/autoload/plug.vim" --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" ;

# OS setup
# Copies OS setup stuff;
let DOTFILES_DIR="~/Repos/dotfiles" ;
echo "Installing walston/dotfiles into $DOTFILES_DIR" ;
git clone git@github.com:walston/dotfiles.git $DOTFILES_DIR ;

ln -nsfv $DOTFILES_DIR/.zshrc ~/.zshrc ;
ln -nsfv $DOTFILES_DIR/.profile ~/.profile ;
ln -nsfv $DOTFILES_DIR/.bash_profile ~/.bash_profile ;
ln -nsfv $DOTFILES_DIR/.vimrc ~/.vimrc;
  
vim +PluginInstall +qall ;
  

