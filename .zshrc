# If you come from bash you might have to change your $PATH.
export PATH=/urs/local/bin:$PATH
export PATH=$PATH:.
export PATH=$PATH:~/bin

export GOPATH="$HOME/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$GOPATH:$GOROOT:$PATH"

export NPM_TOKEN=$(sed 's%^.*=%%' $HOME/.npmrc)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias time="/usr/bin/time"
alias dc="docker-compose"
alias james="rm -rf"

function PluginInstall() {
  if [ -n "$1" ]
  then
    local folder=$(echo "$1" | sed s_^.*/__)
    git clone "https://github.com/$1.git" "$HOME/.vim/pack/packages/start/$folder"
  fi
}

function SetProfile() {
  export ITERM_PROFILE=$1;
  echo -e "\033]50;SetProfile=$1\a"
}

local ret_status="%(?:%{$fg_bold[green]%}⑆:%{$fg_bold[red]%}⑆)"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[magenta]%}) %{$fg_bold[yellow]%}∆"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[magenta]%})"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

source ~/.zsh_profile

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
