#!/bin/bash

echo "# Installing Homebrew" ;
curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/master/install.sh" | bash \
  && brew install git-delta httpie jq nginx ripgrep vim wget zsh;

echo "# Installing ZSH" ;
curl -fsSL "https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | bash ;

echo "# Installing NVM" ;
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh" | bash ;

echo "# Installing vim-plugin manager"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
ln -nsfv "$DOTFILES_DIR/.profile"       "$HOME/.profile" ;
ln -nsfv "$DOTFILES_DIR/.bash_profile"  "$HOME/.bash_profile" ;
ln -nsfv "$DOTFILES_DIR/.vimrc"         "$HOME/.vimrc" ;

vim +PluginInstall +qall ;


